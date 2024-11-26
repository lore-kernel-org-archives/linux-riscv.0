Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA4F1D65538
	for <linux-riscv@archiver.kernel.org>; Tue, 26 Nov 2024 17:54:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MNaUEVtJezI2y0DL9w7ew6NjNRv+zto25DYfSKWwTaw=; b=tOM4rhYxwcNaoV
	mp4te+1T4WQ15/RFDRFOLFZx4hxlIY5xLzuautCm1ilXTKWWNPaQPam+5mjKNJRupcDW7Stb0WRAT
	leRTQOOPNYWjCIzT6qDW3HamO8r9d0SE3zBV52Wchsm4hU9SbIcXsS9VxXVKcCfCFXlY0z9Iskhff
	nwFpAglkK1FFDE5yWa34WjXsFdGeaUPSWRzMxCQUODiHJTiicNcd4aL3S0S7PkUfSys15ZSpaInXe
	ma/vmmT2FRCMpAq4JY+3/3Wzfrkm4lvu+JWANiIAl5mMUbssSxpOMZLW7oCBCTKLhFzC1S5bmUASu
	f8zAprwPytKPXeR/zc5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFzl7-0000000BMN3-40yo;
	Tue, 26 Nov 2024 17:53:57 +0000
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFzl4-0000000BMLc-2WBv
	for linux-riscv@lists.infradead.org;
	Tue, 26 Nov 2024 17:53:56 +0000
Received: by mail-pg1-x536.google.com with SMTP id 41be03b00d2f7-7fc88476a02so51177a12.2
        for <linux-riscv@lists.infradead.org>; Tue, 26 Nov 2024 09:53:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1732643633; x=1733248433; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MRvMPtXoE6OTwypsLw0W8udgu16TFs8eSJzU09tKlVg=;
        b=ufVN1YONcbe1BL8XWqS1t0p7nGJayxW4Oa8dzxbq7PouAghngCGkzbzmxO1Rc0wtoG
         zJmVPwo/OsAFXzdvWedsQy7yn1QeK5/ceKHPbBxlTmzMJOVdy7iuAPPbF6xqNgOBRhb4
         CpUGWlI+H3ekd903It0vQZj3Jmvwd8WSbgOpRAgJa5/IxOwm/5/r14nw8KCyjnJZMg+q
         FdUJjdacRC8i2PY5QM1Wo0jQM6kbmxI2BQJVK0NfV3zmqIB8952zPrVlcJYU9Oh6SU+D
         UdBviwFhcJDXetkPrmnJN1xeq+2bMIrPgX2b3TGZUE+5mWogVljsG1O8B/eseKO0ZmSO
         0psg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732643633; x=1733248433;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MRvMPtXoE6OTwypsLw0W8udgu16TFs8eSJzU09tKlVg=;
        b=JaQoUReGy8i2rGtdOLmyKpvpLHmFSDqMaDtoQgkbeuBmTprznX23Hc5Koh5bcY7m+G
         2C5xdPA+9Qh66wmhenjjQGkRMimkMoyApWEyeBkxp19ezZ8CKHtyGrNLIaowUpI2SAnF
         nYpfp5W7U5rubaZvWzMNtvme7tYViAJ9tqn+e6SKqzVva2XC1TMzgr0YoPexVxY+1ELK
         fAq5rMRuVdSsbzzX5QfyHOO9Oe8VCOzrCByzk5i7teBfyNl79zG7ay4pxNfxXjsEcvw6
         P833gqeF8SqGNFKmiFw9d1Y5GKOMjAymZxUQvWy7M79DhV9zLYrjpUdbByjavbV1b/8l
         7pgg==
X-Forwarded-Encrypted: i=1; AJvYcCUy/Epd7TnIb291qsn50h616YbqeeoR5FCpIYgADONfEQS6B7J0djj4Zc/YpL5VT22uvb/Voq31YZB0sw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz10yRShfyO5fjQoje7ZWQVAGixwKsNiKd0K/Ksghwzc0p2cTFD
	1XM/a2f/Ck1AkNWbmke4bpLyBSYhya4pW3EFvvXf/PKNowtsCHIFa1uEkcO7b0ko6u9S8mgyAho
	zT9tLc9aqUTS3kcSGVza4GieAqxAwx/KTX4Pzn13L8/POvWMW
X-Gm-Gg: ASbGncsDAbUkwJvKxMmrbqEubHnm2w+Cgs687O1zvBkz0Ozi1TuACD+PCZwtLRGBa5T
	nvGwqrLbIVnw2SuiMSk3oKvJp9aZWfsA=
X-Google-Smtp-Source: AGHT+IGZW1AGhZD7D7uISg2mGpYsxZNExsIjnq3Hp4vtRZGoXodU8DhbQfwrEpaifHbwm6KDcthsS2E9y295bvR6uMo=
X-Received: by 2002:a05:6a21:99a0:b0:1e0:d89e:f5cc with SMTP id
 adf61e73a8af0-1e0e0abe5demr483328637.11.1732643633028; Tue, 26 Nov 2024
 09:53:53 -0800 (PST)
MIME-Version: 1.0
References: <20241124221458.347464-1-michaelneuling@tenstorrent.com>
 <CAAhSdy2Qq61qSLkuFkgiT2o5wXNDp3qO=U40AU1CFkcY6iNYhw@mail.gmail.com> <CAAQMj+ojdJ3iQ7HHpPudai=yuKwKwhT4VFCdAnrAGA11oSPgcw@mail.gmail.com>
In-Reply-To: <CAAQMj+ojdJ3iQ7HHpPudai=yuKwKwhT4VFCdAnrAGA11oSPgcw@mail.gmail.com>
From: Atish Kumar Patra <atishp@rivosinc.com>
Date: Tue, 26 Nov 2024 09:53:42 -0800
Message-ID: <CAHBxVyH+nhZoJtZityYh42wjv7fHHqOQtCv-zJ6n1s8sg2uiaw@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: KVM: Fix csr_write -> csr_set for HVIEN PMU
 overflow bit
To: Michael Neuling <MichaelNeuling@tenstorrent.com>
Cc: Anup Patel <anup@brainfault.org>, linux-riscv@lists.infradead.org, 
	kvm-riscv@lists.infradead.org, palmer@dabbelt.com, 
	Michael Neuling <mikey@neuling.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241126_095354_894187_B0A88A48 
X-CRM114-Status: GOOD (  11.26  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gU3VuLCBOb3YgMjQsIDIwMjQgYXQgODo0MeKAr1BNIE1pY2hhZWwgTmV1bGluZwo8TWljaGFl
bE5ldWxpbmdAdGVuc3RvcnJlbnQuY29tPiB3cm90ZToKPgo+ID4gPiBUaGlzIGRvZXNuJ3QgY2F1
c2UgYSBwcm9ibGVtIGN1cnJlbnRseSBhcyBIVklFTiBpc24ndCB1c2VkIGVsc2V3aGVyZQo+ID4g
PiB5ZXQuIEZvdW5kIGJ5IGluc3BlY3Rpb24uCj4gPiA+Cj4gPgo+ID4gRml4ZXMgdGFnID8KPgo+
IEknbGwgcmVzZW5kIGluIGEgZmV3IGRheXMgYnV0IGl0J3M6Cj4KPiBGaXhlczogMTZiMGJkZTlh
MzdjICgiUklTQy1WOiBLVk06IEFkZCBwZXJmIHNhbXBsaW5nIHN1cHBvcnQgZm9yIGd1ZXN0cyIp
Cj4KClRoYW5rcyBmb3IgY2F0Y2hpbmcgdGhpcy4KUmV2aWV3ZWQtYnk6IEF0aXNoIFBhdHJhIDxh
dGlzaHBAcml2b3NpbmMuY29tPgoKPiAoSSd2ZSBhbHNvIGFkZGVkIEF0aXNoIHRvIENDIHdobyB3
YXMgdGhlIG9yaWdpbmFsIGF1dGhvcikKPgo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBNaWNoYWVsIE5l
dWxpbmcgPG1pY2hhZWxuZXVsaW5nQHRlbnN0b3JyZW50LmNvbT4KPiA+Cj4gPiBPdGhlcndpc2Ug
aXQgbG9va3MgZ29vZCB0byBtZS4KPiA+Cj4gPiBSZXZpZXdlZC1ieTogQW51cCBQYXRlbCA8YW51
cEBicmFpbmZhdWx0Lm9yZz4KPgo+IFRoYW5rcy4KPgo+IE1pa2V5CgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QK
bGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
