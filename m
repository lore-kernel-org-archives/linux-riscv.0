Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 978FEC4332F
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Dec 2022 19:52:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=P20bW1PoEKPsWwriEaznjP9V0rIeDPOqYORfllgDJ+I=; b=sD5hgP/E44+tst
	vA79jrFQ4gGCW4ND2qWg22XX8LJSTjVPU/asUWyf9db6YV1/0H4A6kVVlzltO3ZszD1+dxK0nkG65
	ZVMVQJDkhXvwNmSK1WW3rCjpLjdopSw403n1NIS6BpBts13z7PsC6takvciy5hsL+rcrW2VBWSW1Y
	IOoa+C+XUQI3JKWJZfMA+XV7D832GgreMRSU8iIYTVO/ACmGoDM917ZYcZroNH+6AphrinONCqqte
	tjwdz1muwu/T4atJMS12MBDhUTA6ZaUEy3+McSEzkdKcOFWCpyAze7zL7P6AukDWCYHUo7JdMQK4M
	SlsytYGJqUhIjGSiIl8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p858N-001Wo6-2p; Wed, 21 Dec 2022 19:52:11 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p858K-001WnA-5x
	for linux-riscv@lists.infradead.org; Wed, 21 Dec 2022 19:52:09 +0000
Received: by mail-pj1-x102d.google.com with SMTP id hd14-20020a17090b458e00b0021909875bccso4062083pjb.1
        for <linux-riscv@lists.infradead.org>; Wed, 21 Dec 2022 11:52:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kMuHxTFwv/l/rM5PVMCvKqbEDcuC1/cPLK8XmNLhCZM=;
        b=RbtNwa7mtjav08LE3o+xK2+2UDCr+m+yKCbPE1Bcf61xIqlkkbXlZyfPU5mlZpBc7P
         Fj6ZZsLgYmBQCHvojp1Kkwuh51+SFpGaX95KeIKz9c6uWO0b8XBPd/g9/NQ43pBD4zk5
         4aOiDXSyQn1PSE1Ptw8FESUB158tHl3Y67LGPrAt9P6uov6p95kLaY3G/FOTHv9zoe9s
         qnsT+97Z+1pVaEKU6hLrc+HvGditARBlqKuekG/QMCMtg8qomf1Ua5PiXTFV4403vUhl
         6Rk0qqc02rDU7q5barP+2cjQIQuOWs70h0Z9OZGifVfFBUXCiWzmSLaklklBkKU/poGs
         Naow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kMuHxTFwv/l/rM5PVMCvKqbEDcuC1/cPLK8XmNLhCZM=;
        b=394oNWH0Hj9hlovZgW/tnpMy31y60uSWX6VwJ/FNqLyOiSMM57vbi1zgcm7CVHWQMp
         +CtzsMq+qXHNKf8Zwr3kM5fkocGYFQa5Q9qBja0ijbdnG9XcWmZt3WtmAsWAstITvsbq
         Tu3+pqTWbMSqq3yBNfSXEoHOYegpPhhyMKKT4WUIPc5TP0OJnrlYbM+29NNrxkFvdQaE
         P5Zy9MLacvFFQwKeEBeeAfHD6zyw5Ht2tTevS6kvcnrUlVq5EKNJGqvQ/H0e2hv8hFfN
         WUYMu6EG/idMjFULtyLqgG6SadxCcA5wQ6KCkKpMwes+VrLV6Vr4LYeXMmi+4jzkTvNG
         mvaA==
X-Gm-Message-State: AFqh2kpWodcSmF4vQu1rL7j87jGvnSoppWG+g1sjVDyC16LKYk5PcRNj
	j8w/2KinXMlfA8rzz1j0jIZGnw==
X-Google-Smtp-Source: AMrXdXsqUpkR20wHZpXEYj3aO9STkpIe+o/gcDsBOOOQSDMFZuIIJwQW0q7UFLMGvbTIJZWiHHGsWA==
X-Received: by 2002:a17:90b:124b:b0:220:7147:c981 with SMTP id gx11-20020a17090b124b00b002207147c981mr18362863pjb.29.1671652326561;
        Wed, 21 Dec 2022 11:52:06 -0800 (PST)
Received: from [192.168.50.116] (c-24-4-73-83.hsd1.ca.comcast.net. [24.4.73.83])
        by smtp.gmail.com with ESMTPSA id cp20-20020a17090afb9400b00212e5fe09d7sm1801167pjb.10.2022.12.21.11.52.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Dec 2022 11:52:06 -0800 (PST)
Message-ID: <7430f494-9b43-5e03-c1e9-6b83e2611a11@rivosinc.com>
Date: Wed, 21 Dec 2022 11:52:04 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: Adding V-ext regs to signal context w/o expanding kernel struct
 sigcontext to avoid glibc ABI break
Content-Language: en-US
From: Vineet Gupta <vineetg@rivosinc.com>
To: Vincent Chen <vincent.chen@sifive.com>
Cc: Florian Weimer <fweimer@redhat.com>, Rich Felker <dalias@libc.org>,
 Andrew Waterman <andrew@sifive.com>, Palmer Dabbelt <palmer@rivosinc.com>,
 Kito Cheng <kito.cheng@sifive.com>,
 =?UTF-8?Q?Christoph_M=c3=bcllner?= <christoph.muellner@vrull.eu>,
 davidlt@rivosinc.com, Arnd Bergmann <arnd@arndb.de>,
 =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>,
 Szabolcs Nagy <szabolcs.nagy@arm.com>, Andy Chiu <andy.chiu@sifive.com>,
 Greentime Hu <greentime.hu@sifive.com>, Aaron Durbin <adurbin@rivosinc.com>,
 Andrew de los Reyes <adlr@rivosinc.com>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 GNU C Library <libc-alpha@sourceware.org>
References: <1631497278-29829-1-git-send-email-vincent.chen@sifive.com>
 <1631497278-29829-3-git-send-email-vincent.chen@sifive.com>
 <871r5sd1zq.fsf@oldenburg.str.redhat.com>
 <20210913135247.GL13220@brightrain.aerifal.cx>
 <CABvJ_xjGZ3S0oAkT08x4DToQFdcUH06omk2OTT1EHDZRJ-2wKg@mail.gmail.com>
 <87sfy5ndid.fsf@oldenburg.str.redhat.com>
 <CABvJ_xjSREsdemJkCJMGSx+09jrNoSbXCwuxF0zEQmZtHrWMvg@mail.gmail.com>
 <d613968f-0fae-1994-3bee-fb10765167c3@rivosinc.com>
 <73c0124c-4794-6e40-460c-b26df407f322@rivosinc.com>
 <CABvJ_xgDsthnm_h6mYowK03VUKqYk=nZsSZ7R=0BTwFHGKEAMw@mail.gmail.com>
 <50c598a6-e3b3-3062-abe7-23a406067533@rivosinc.com>
In-Reply-To: <50c598a6-e3b3-3062-abe7-23a406067533@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221221_115208_263710_0B769616 
X-CRM114-Status: GOOD (  12.28  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

CgpPbiAxMi8yMS8yMiAxMTo0NSwgVmluZWV0IEd1cHRhIHdyb3RlOgo+Cj4gNC4gS2VybmVsIHdp
dGggUlZWIHN1cHBvcnQgKyB1c2VyIHByb2dyYW0gdXNpbmcgb3JpZ2luYWwgR2xpYmMgc2lnY29u
dGV4dAo+IEluIHRoaXMgY2FzZSwgdGhlIGtlcm5lbCBuZWVkcyB0byBzYXZlIHZlY3RvciByZWdp
c3RlcnMgY29udGV4dCB0bwo+IG1lbW9yeS4gVGhlIHVzZXIgcHJvZ3JhbSBtYXkgZW5jb3VudGVy
IG1lbW9yeSBpc3N1ZXMgaWYgdGhlIHVzZXIgc3BhY2UKPiBkb2VzIG5vdCByZXNlcnZlIGVub3Vn
aCBtZW1vcnkgc2l6ZSBmb3IgdGhlIGtlcm5lbCB0byBjcmVhdGUgdGhlCj4gc2lnY29udGV4dC4g
SG93ZXZlciwgd2UgY2FuJ3Qgc2VlbSB0byBhdm9pZCB0aGlzIGNhc2Ugc2luY2UgdGhlcmUgaXMK
PiBubyBmbGV4aWJsZSBtZW1vcnkgYXJlYSBpbiBzdHJ1Y3Qgc2lnY29udGV4dCBmb3IgZnV0dXJl
IGV4cGFuc2lvbi4KClRoaXMgaXMgbm90IGFuIGlzc3VlLCBpZiB3ZSBkb24ndCBjaGFuZ2Ugc2ln
Y29udGV4dCAoaW4ga2VybmVsIGFuZCAKZ2xpYmMpIC0gaXQgaXMgZXNzZW50aWFsbHkgdGhlIGNh
c2Ugb2YgZXhpc3RpbmcgYmluYXJpZXMuCmtlcm5lbCBzdGlsbCBzYXZlcyByZWdzIG9uIHVzZXIg
c3RhY2ssIGluIHJ0X3NpZ2ZyYW1lLCBpdHMganVzdCB0aGF0wqAgCnVzZXJzcGFjZSBpcyBub3Qg
YWJsZSB0byBhY2Nlc3MgdGhlbSBpbiBTQV9TSUdJTkZPIHNpZ25hbCBoYW5kZXJzLgphYXJjaDY0
IGhhdmUgdGhpcyBpbXBsZW1lbnRlZCB0aGlzIGFwcHJvYWNoIGFuZCBpdCBpcyBsaWtlbHkgdGhl
eSBjYW4ndCAKZG8gdGhhdCBlaXRoZXIgZm9yIFNWRSByZWdzLgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cmxp
bnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
