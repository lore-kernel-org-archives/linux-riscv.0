Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19385C4332F
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Dec 2022 20:31:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZvwKUzb+P+yRZVC5nkNq0G18vx0VOwShibW5lEBacH4=; b=PwSWd9T3k4Rkr9
	kFJXrwgOMllT1cwcMde9JNkdrUsIvMPiv4ij8fWyChFc8P/v0MNBJ07e1XCNa5KFu2VUhRYtgliE/
	3CDystMV0Kvj51cMDvJ5oy0Dmg1iEA/LVD3JPansYQKLnmRb0rmK9yESV0zFMER+e9kPOVlT5HvNV
	pPognDmOqlclYYgVkWLbXyxzaUfsJUx4zkWwT/5STocpsZiLaXy83xTXq3RqRh7wGcav6t7MZsHQk
	A5fsmqTo4YeBxwGRTEaHxGDf0j/HcXZ5WzIXd1xej395+amLHPLOnB19iUBtesP1fTZBwbH7SG40L
	CW0HofhmXPtWtvM4CjCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p8SDR-00Gu4s-C4; Thu, 22 Dec 2022 20:30:57 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p8SDO-00Gu2k-W7
	for linux-riscv@lists.infradead.org; Thu, 22 Dec 2022 20:30:56 +0000
Received: by mail-pj1-x1035.google.com with SMTP id z8-20020a17090abd8800b00219ed30ce47so6855476pjr.3
        for <linux-riscv@lists.infradead.org>; Thu, 22 Dec 2022 12:30:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+QPNI8KTzJ0FXuAGtauWbwwpxzA1aX3xt2Azn1cq0is=;
        b=gqzuoDbKXPnYcA02Jiwf/W5HbCF7AcAidyUyuR1l0c6NUK7B2xbZJ9tSuIkhxd/PcC
         dw6cSCp6TVqgRVdyr/Qv+CfzoYkjurtc0mlPrdwJNXlPFKS4dkYXMxAJNLLFi/zgxmdU
         7y93BTxfCAUtQKxeS1+ldkP5l06enEVMxEjUIamsR5fCRzKxYMp1Fc5wpo63xsTr19Y0
         F64lKLd9ygI/GeQRNVqmAPjPZK81oAX0hQDeWvgaTZ0We62gxnzQZnShv95BoaFEIz5t
         LPa0m1WZNfkR41kqTyrVJbg7pObsRzKuCz/wINmFpKGHmx2nXuUA87WUieBACSdMLufO
         4cyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+QPNI8KTzJ0FXuAGtauWbwwpxzA1aX3xt2Azn1cq0is=;
        b=fL8rGuMeyQ5PoUPpRcSBLleIuEC3Le1h7BCp0i2wt83a65hGg5rX40mXFE3723ZA+S
         6sngrEfl7ZiPeNNhSGUd+wF266VDTrSh4Pkt0G2pPcMz60OU8Wwx0phdswVo88RnHMwO
         LiocujEZCxpwuWFz5x9kaqhTHyu0wrPWb6uoKias5V+9dHyQov/LzmyfgIIvnwAw2GPa
         IVAUBNeIdGOorwOAXIVVf9y5EZ8eC/XnjjuG2x9RuYG7otNYFHjsQUphOlig5whfwcIV
         9RJknCdk+Xf8R+xNXzLTB5vzaNgfqMknkyT5nyVVIKpPTiaNKoCaPkyibhFuWpHNwrmg
         EEgA==
X-Gm-Message-State: AFqh2kpKXOh+H/uMKjTmk4IeNeND6pQj98/2KxqZUJfMnvEX4TSfk4s2
	nmWHpEulQgr+k5dGhHDa0abBjQ==
X-Google-Smtp-Source: AMrXdXu8PGdlTDxyMeEuyaIJcTQe40vQG/Nio7FueDP1bv+yJX1HxM7pKYh6OU8r4iNOk7WHK4BGIQ==
X-Received: by 2002:a17:902:c9cc:b0:188:5b7d:738a with SMTP id q12-20020a170902c9cc00b001885b7d738amr6714490pld.29.1671741053144;
        Thu, 22 Dec 2022 12:30:53 -0800 (PST)
Received: from [192.168.50.116] (c-24-4-73-83.hsd1.ca.comcast.net. [24.4.73.83])
        by smtp.gmail.com with ESMTPSA id l2-20020a170903244200b001888cadf8f6sm964241pls.49.2022.12.22.12.30.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Dec 2022 12:30:52 -0800 (PST)
Message-ID: <6b79d32c-2e59-09b6-2132-4b99e2a8923e@rivosinc.com>
Date: Thu, 22 Dec 2022 12:30:51 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: Adding V-ext regs to signal context w/o expanding kernel struct
 sigcontext to avoid glibc ABI break
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>,
 Vincent Chen <vincent.chen@sifive.com>
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
 <7430f494-9b43-5e03-c1e9-6b83e2611a11@rivosinc.com>
 <b67238bf-4b5d-dd17-99ff-88b0270ce10a@linaro.org>
From: Vineet Gupta <vineetg@rivosinc.com>
In-Reply-To: <b67238bf-4b5d-dd17-99ff-88b0270ce10a@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221222_123055_065622_54F17015 
X-CRM114-Status: GOOD (  15.12  )
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

CgpPbiAxMi8yMS8yMiAyMTozMiwgUmljaGFyZCBIZW5kZXJzb24gd3JvdGU6Cj4gT24gMTIvMjEv
MjIgMTE6NTIsIFZpbmVldCBHdXB0YSB3cm90ZToKPj4gVGhpcyBpcyBub3QgYW4gaXNzdWUsIGlm
IHdlIGRvbid0IGNoYW5nZSBzaWdjb250ZXh0IChpbiBrZXJuZWwgYW5kIAo+PiBnbGliYykgLSBp
dCBpcyBlc3NlbnRpYWxseSB0aGUgY2FzZSBvZiBleGlzdGluZyBiaW5hcmllcy4ga2VybmVsIAo+
PiBzdGlsbCBzYXZlcyByZWdzIG9uIHVzZXIgc3RhY2ssIGluCj4+IHJ0X3NpZ2ZyYW1lLCBpdHMg
anVzdCB0aGF0IHVzZXJzcGFjZSBpcyBub3QgYWJsZSB0byBhY2Nlc3MgdGhlbSBpbiAKPj4gU0Ff
U0lHSU5GTyBzaWduYWwKPj4gaGFuZGVycy4gYWFyY2g2NCBoYXZlIHRoaXMgaW1wbGVtZW50ZWQg
dGhpcyBhcHByb2FjaCBhbmQgaXQgaXMgbGlrZWx5IAo+PiB0aGV5IGNhbid0IGRvCj4+IHRoYXQg
ZWl0aGVyIGZvciBTVkUgcmVncy4KPgo+IGFhcmNoNjQgY2FuIGNlcnRhaW5seSBhY2Nlc3MgdGhl
IFNWRSByZWdzIG9uIHRoZSBzaWduYWwgc3RhY2suwqAgSXQgCj4gc2ltcGx5IHJlcXVpcmVzIHRo
YXQgeW91IHBhcnNlIHRoZSBjaGFpbiBvZiBleHRlbnNpb25zIHdpdGhpbiAKPiBfX3Jlc2VydmVk
IHRvIGZpbmQgaXQuCj4gSXQncyBxdWl0ZSB3ZWxsIGRlc2lnbmVkLCByZWFsbHkuCgpZZXAgSSd2
ZSBiZWVuIHN0YXJpbmcgYXQgaXQgdGhpcyB3ZWVrIGFuZCByZWFsbHkgYXBwcmVjaWF0ZSB0aGUg
CmV4dGVuc2libGUgZGVzaWduLiBJbmRlZWQgb25lIGNhbiBkbyB0aHJ1IHRoZSBleGlzdGluZyBf
X3Jlc2VydmVkIGluIApzaWdjb250ZXh0IHRvIGFjY2VzcyB0aGF0IGZyb20gdXNlcnNwYWNlLgoK
Cj4KPiBXaGF0IHlvdSBjYW4ndCBkbyBpcyAib25seSIgZGVjbGFyZSBhIHNpZ2NvbnRleHRfdCBh
bmQgYmUgYWJsZSB0byAKPiBjb25zdHJ1Y3QgYSBuZXcgY29udGV4dCwgbm9yIGNvcHkgdGhlIGVu
dGlyZSBjb250ZXh0IHZpYSBzdHJ1Y3R1cmUgCj4gYXNzaWdubWVudC4KPgo+IFRoZXJlIGlzIHJv
b20gd2l0aGluIHRoZSByaXNjLXYgY29udGV4dCBmb3IgYSBzaW1pbGFyIHNjaGVtZSwgdmlhCj4K
PiDCoMKgwqAgc2lnY29udGV4dC5zY19mcHJlZ3MucS5yZXNlcnZlZFszXQo+Cj4gRS5nLgo+Cj4g
wqDCoMKgIHJlc2VydmVkWzBdIC0+IG1hZ2ljCj4gwqDCoMKgIHJlc2VydmVkWzFdIC0+IGRpc3Bs
YWNlbWVudCB0byAiZXh0ZW5zaW9uIGFyZWEiCj4gwqDCoMKgIHJlc2VydmVkWzJdIC0+IHNpemUg
b2YgImV4dGVuc2lvbiBhcmVhIgo+Cj4gVGh1cyB0aGUgYXJlYSBjYW4gYmUgbG9jYXRlZCBhbnl3
aGVyZSB3aXRoaW4gNEdCIGFuZCBleHBhbmQgdG8gNEdCLgo+IE5vdCB0aGF0IEknZCBob3BlIGFu
eSBzaWduYWwgZnJhbWUgd291bGQgcmVxdWlyZSA0R0IuwqAgOi0pCgpMb29rcyBsaWtlIHdlIGFs
bW9zdCBtaXNzZWQgdGhpcy4gVGh4IGZvciB0aGUgcG9pbnRlciBSaWNoYXJkLgoKLVZpbmVldAoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJp
c2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
