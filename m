Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D599CC02185
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Jan 2025 14:58:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9kQumNQMiXb9Lk4oyW9F3botdS5bdKAYMMm/Jtstpc8=; b=e8B6pn4K6KwEDP
	66qMAsyMmrU58btFGK4xJkhgp666AABAL6mjuegUgZPuAfo3pOOZtpxC0xWwHc9qm5yINJUjhtksj
	52S+sHKtVvWQxhpmRd9ti/7gHRi3KK3OZ/0/tn0eHFutWcNZyuIU33CzK5TyawsbFAZibygx2o5Id
	Rj08h19JnucGIm/9ZBSfOecP/NulGI9Pu8W2UA0BdIy7lHVkgRnmF/NG/+NWA1oOqGKP0FeDiKi8a
	UtJARLLEFVkLXkRHJAtgInXOYbv5wV7zP4noj07G86LlnNO0fenSqqmzMH9/jOiRJqBioGblZ1buH
	ZF5pC6Lk7/FowJo8UKOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tY4qp-0000000CCc3-0VSp;
	Wed, 15 Jan 2025 14:58:35 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tY4qm-0000000CCbU-3GNk
	for linux-riscv@lists.infradead.org;
	Wed, 15 Jan 2025 14:58:33 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-21644aca3a0so152113395ad.3
        for <linux-riscv@lists.infradead.org>; Wed, 15 Jan 2025 06:58:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736953112; x=1737557912; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=h4LyUD0OOxdJzu90JvN9bagFxwSCECVXzNkc9ZMOtLg=;
        b=ezlWIL4kTivWtz2bHOWzwyzeEvMwsSBTIskvuPV7c0zJe6LTpXcgco61w825HbMgsT
         mIuUSNyI4r+3RGE9QzJPVKibEGGce3mA9OFKKTvKxaFDI42MCUGkcX0eoRZN0Mb2jqVw
         PdPRhkJq51g74ZuEIfD1fUXCwHQp6lBD9xvHExE1JPDN1/zWSlV//13zZsTD2Uu5Ppfy
         Vaj0jFMdpV3fcrRA8MhO3yO6JqtAurT2dyosAO8rScdXxUEdoXewCgb/gHpA+CkuSvsE
         1fqu88sUrQ+p+gQGJVNrI5bGt466BU7TaB9qJOGOT/sSk4aY5yEkzjnASlMTbyL4bB9C
         m32Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736953112; x=1737557912;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=h4LyUD0OOxdJzu90JvN9bagFxwSCECVXzNkc9ZMOtLg=;
        b=uuqPegLNl6/yj6RElevd5Lw2qN2J3nFPAuex1JsulSWcbtbEhOzgIHjRrSOOVsgnwm
         Pw6q7dwATICevsSG0cjtFAZzABRIytqnHvcV+Sw/T8MZTre3gy+4M2Cb2zbAktI70iHQ
         iwLcsb/7sf2wwZ7xPeKwamRG9QzVPVGY1qdPUOHLJcG6RvPe1gAboGUaH4ctgFMD3dnH
         LuJmjV5+4FGnqJkUElZQ8n1CKVOA3tN/pYIxn+tyeHO5w99970GNqsOKdA3FQgEkGfmG
         ybuyFYEVocVkAXSPPj0CFs9g+GRwVuByft5672Pht+LOqOWqYaabB63dm5kMfByc77H7
         +CXA==
X-Gm-Message-State: AOJu0Yz1rpAE/TTq/W53ml2qVlgClyEQCxb8SJl8BuN242NyQmAYeS1A
	ff9882g6D46Q5L6MYtzPHg0QR6g8a9zW7mXBWfyLgRJ5+06q4OriBgjJw0Tf
X-Gm-Gg: ASbGncs0j47FEpZFZ+UYmNKBwdPW+SUgl/MfbUiDWepZQ5snpc0qG7L7UcOKGR5/Fqk
	7Ze3NLTstC3yJT234vzTARGz0FWWj9NiDdHhIEd1l+SWKENaTcpf+2vjgBO/g4NSGkvtK8Hzjc6
	uefsyz2t1yY8DenYSybIm4WDtXvbIaTMr7qXF2mVD/iLblsyYoafXU/BHIcwM8rLWEQnsxwaI4N
	NZCI6cpNkc2tPOiLge5XjJNd8KNj/WJWtpyK4D8QfUlj5URrv5xYVsMQvqn
X-Google-Smtp-Source: AGHT+IHfR50hWUeJr7PLoQ18JoVrCmAzH6LpunCANfDe4BF4ME+lUfLxQPC7WAxbY7XRWb+iIQQLcA==
X-Received: by 2002:a17:902:db0e:b0:215:a57e:88e7 with SMTP id d9443c01a7336-21a83f48cd6mr428700115ad.3.1736953111811;
        Wed, 15 Jan 2025 06:58:31 -0800 (PST)
Received: from [172.31.0.17] ([136.60.141.45])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21a9f22ecf2sm84321395ad.192.2025.01.15.06.58.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jan 2025 06:58:31 -0800 (PST)
Message-ID: <971d5cd3-f7fc-47d6-93da-be8f8a101901@gmail.com>
Date: Wed, 15 Jan 2025 07:58:30 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Page sizes supported by RISC-V
To: Florian Weimer <fweimer@redhat.com>, "Maciej W. Rozycki"
 <macro@orcam.me.uk>
Cc: linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@rivosinc.com>,
 Xu Lu <luxu.kernel@bytedance.com>
References: <878qvbzqfx.fsf@oldenburg.str.redhat.com>
 <e55950a2-beb0-4f2a-81da-1c66724116d7@gmail.com>
 <8734lixzss.fsf@oldenburg.str.redhat.com>
 <cbbc9925-12a5-4043-a6c5-ccd1ef0997c8@gmail.com>
 <31ce4016-9420-4143-ae31-faf36a878cb4@gmail.com>
 <alpine.DEB.2.21.2501150631330.50458@angie.orcam.me.uk>
 <87msfsldl8.fsf@oldenburg.str.redhat.com>
Content-Language: en-US
From: Jeff Law <jeffreyalaw@gmail.com>
In-Reply-To: <87msfsldl8.fsf@oldenburg.str.redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_065832_818593_3BD4EFB7 
X-CRM114-Status: GOOD (  18.45  )
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

CgpPbiAxLzE1LzI1IDEyOjUxIEFNLCBGbG9yaWFuIFdlaW1lciB3cm90ZToKPiAqIE1hY2llaiBX
LiBSb3p5Y2tpOgo+IAo+PiBPbiBUdWUsIDE0IEphbiAyMDI1LCBKZWZmIExhdyB3cm90ZToKPj4K
Pj4+Pj4gSSB1bmRlcnN0YW5kIHRoYXQgbm90IG1ha2luZyBhIGNhbGwgaW4gdGhlIHNwZWNpZmlj
YXRpb25zIGF2b2lkcyB0aGUKPj4+Pj4gbmVlZCB0byByZXNvbHZlIHRoZXNlIGNvbmZsaWN0cy7C
oCBCdXQgaWYgeW91IGRvbid0IGRlZmluZSBhIG1heGltdW0gcGFnZQo+Pj4+PiBzaXplIHRoZXJl
LCBpdCBpcyBlZmZlY3RpdmVseSBzcGVjaWZpZWQgYXMgNDA5NiBieXRlcy7CoCBUaGlzIHdpbGwg
Y2F1c2UKPj4+Pj4gcHJvYmxlbXMgaWYgZGlzdHJpYnV0aW9ucyB0YXJnZXRpbmcgbGFyZ2Ugc3lz
dGVtcyB3YW50IGEgbGFyZ2VyIHBhZ2UKPj4+Pj4gc2l6ZSBiZWNhdXNlIGl0IGJldHRlciBhbGln
bnMgd2l0aCB0aGUga2luZCBvZiBoYXJkd2FyZSB0aGV5IHRhcmdldC4KPj4+Pj4gSXQncyByZWFs
bHkgYmFkIGZvciBjcm9zcy1kaXN0cmlidXRpb24gYmluYXJ5IGNvbXBhdGliaWxpdHksIHNvbWV0
aGluZwo+Pj4+PiB0aGF0J3MgaW1wb3J0YW50IG91dHNpZGUgdGhlIGVtYmVkZGVkIHNwYWNlIGFu
ZCBwcm9iYWJseSBuZWNlc3NhcnkgZm9yCj4+Pj4+IG1haW5zdHJlYW1pbmcuCj4+Pj4+Cj4+Pj4+
IChPZiBjb3Vyc2UgeW91IGtub3cgYWxsIHRoaXMuIDgtKQo+Pj4+IFl1cC7CoCBPbmNlIGl0J3Mg
YmFrZWQgaW50byBvbmUgc2lnbmlmaWNhbnQgZGlzdHJvLCBpdCdzIGRvaW5nIHRvIGJlCj4+Pj4g
Ymxvb2R5IGhhcmQgdG8gY2hhbmdlLsKgIEknbSBzdXJlIHdlIGJvdGggcmVtZW1iZXIgdGhlIFBQ
QyBwYWdlc2l6ZSBzdHVmZgo+Pj4+IGZyb20gYSBmZXcgeWVhcnMgYmFjayA7KAo+Pj4+Cj4+Pj4g
SSBzdHJvbmdseSBzdXNwZWN0IHRoZSBsYWNrIG9mIHNwZWNpZmljYXRpb24gaGVyZSBpcyBtZWFu
IHRvIGdpdmUKPj4+PiBkZWdyZWVzIG9mIGZyZWVkb20gdG8gdGhlIGltcGxlbWVudG9ycywgYnV0
IHNvbWV0aW1lcyB0aG9zZSB3cml0aW5nIHRoZQo+Pj4+IHNwZWNzIGRvbid0IHJlYWxseSB1bmRl
cnN0YW5kIHRoZSBpbXBsaWNhdGlvbiBvZiBsZWF2aW5nIHRoaW5ncyBsaWtlCj4+Pj4gdGhpcyB1
bnNwZWNpZmllZCBhbmQgaG93IG11Y2ggcGFpbiBpdCByZWFsbHkgY2F1c2VzIGluIHRoZSBlbmQu
Cj4+PiBTbyByZXN1cnJlY3RpbmcgdGhpcyBkaXNjdXNzaW9uLgo+Pj4KPj4+IElzIHRoZXJlIGFu
eSByZWFsaXN0aWMgY2hhbmNlIG9mIGJ1bXBpbmcgdGhlIG1pbmltdW0gcGFnZXNpemUgZm9yIHJp
c2Mtdgo+Pj4gYXQgdGhpcyBwb2ludD8gIFh1IEx1IGFuZCBoaXMgdGVhbSBoYXZlIHNvbWUgY29t
cGVsbGluZyBkYXRhIHRoYXQKPj4+IGluZGljYXRlcyBtb3ZpbmcgZm9yd2FyZCB0byA2NGsgY291
bGQgYmUgaGlnaGx5IHByb2ZpdGFibGUuICBUaGF0IHdvcmsKPj4+IHdhcyBkb25lIG9uIGFhcmNo
NjQsIGJ1dCBzaG91bGQgYmUgZ2VuZXJhbGx5IGFwcGxpY2FibGUgdG8gcmlzY3YgYXMgd2VsbC4K
Pj4KPj4gQ2FuJ3Qgd2Ugc2ltcGx5IG1ha2UgYSByZWFzb25hYmxlIGd1ZXNzL2Fzc3VtcHRpb24g
anVzdCBmb3IgdGhlIHB1cnBvc2UKPj4gb2YgdG9vbGluZz8KPiAKPiBUaGF0IHJlYXNvbmFibGUg
ZGVmYXVsdCBleGlzdHMgdG9kYXkgYW5kIGlzIDQwOTYuICBTb21lIGVmZm9ydCBpcwo+IHJlcXVp
cmVkIHRvIGNoYW5nZSB0aGF0LgpSaWdodC4gIEFueSBjaGFuZ2UgaW4gdGhpcyB2YWx1ZSBpcyBh
IHJlYnVpbGQtdGhlLXdvcmxkIGVmZm9ydCB3aXRoIGEgCmZsYWcgZGF5IGZvciBiaW5hcnkgY29t
cGF0aWJpbHR5LiAgUGx1cyB0aGVyZSdzIGlzc3VlcyBmb3IgY3Jvc3MgZGlzdHJvIApjb21wYXRp
YmlsaXR5IGFuZCBldmVuIHF1ZXN0aW9ucyBhYm91dCB3aGV0aGVyIG9yIG5vdCBhbnkgZXhpc3Rp
bmcgCnN5c3RlbXMgY291bGQgc3VwcG9ydCBhbnl0aGluZyBidXQgNGsgcGFnZXNpemVzLgoKCgo+
IAo+PiBCYXNlZCBvbiB0aGUgZXhwZXJpZW5jZSB3aXRoIE1JUFMvQUFyY2g2NCBzaGFyZWQgaGVy
ZSB0aGVyZSBzaG91bGQgYmUgbm8KPj4gZGlzYWdyZWVtZW50IGFzIHRvIGdvaW5nIGZvciBhdCBs
ZWFzdCA2NEtpQiBJIHN1cHBvc2UuICBUaGVuIHNoYWxsIHdlIGdvCj4+IGJleW9uZCB0byBsZWF2
ZSByb29tIGZvciBzb21lIGV4cGFuc2lvbiwgc3VjaCBhcyBmb3IgMjU2S2lCPwo+IAo+IFRoZSBh
bHRlcm5hdGl2ZSB3b3VsZCBiZSB0byBmaXggTGludXggc28gdGhhdCBpdCBzdXBwb3J0cyBtdWx0
aXBsZSBwYWdlCj4gc2l6ZXMuICBUaGVuIGZyb20gYW4gYXBwbGljYXRpb24gcGVyc3BlY3RpdmUg
KGFuZCBkeW5hbWljIGxpbmtlcgo+IHBlcnNwZWN0aXZlKSwgdGhlIHBhZ2Ugc2l6ZSBjb3VsZCBy
ZW1haW4gYXQgNDA5NiBieXRlcy4gIEkgdW5kZXJzdGFuZAo+IHRoaXMgaXMgZGlmZmljdWx0IGJl
Y2F1c2Ugb25jZSB5b3UgaGF2ZSBtdWx0aXBsZSBwYWdlIHNpemVzLCB0aGVyZSBhcmUKPiBjb25j
ZXJucyByZWdhcmRpbmcgZnJhZ21lbnRhdGlvbi4KU28gZXNzZW50aWFsbHkgYnJlYWsgdGhlIGhh
cmQgdGllIGJldHdlZW4gdGhlIGtlcm5lbCBhbmQgdXNlcmNvZGUgYW5kIAphbGxvdyB0aGVtIHRv
IHZhcnkgaW5kZXBlbmRlbnRseS4uLiAgSG1tLi4uLgoKamVmZgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cmxp
bnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
