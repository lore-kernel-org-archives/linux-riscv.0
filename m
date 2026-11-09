Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19444606A322
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Nov 2026 03:48:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=YWdKm/Zv;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=Zf+cx80G
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=YxCmdg00fRrY2+RQMt/lT8ZV2UGQWLAXL0XzssbsZKA=; b=YWdKm/Zv1UGdahURVj+FQyEhQs
	w2w5CjrkWGqcOxc6Nbo75P1U6tseC956zlzrS+DM0x2fT70QVgjSwGXuPCspdrImGEZ209ICMEd3U
	sVxgfOCAA++m6B7RZqpy1lpe2+7O8NfebQ7WReFE5AFlNMxlKmysNjCPOZbGYnVOkBkt17VcuLvJC
	MRcW+ZuABzz+5fjsWggb9cbAzeAPSEnXfcMPX2fgncenSA/XM81QPzo2cKLatC8FYAnuLB3CkjKQ8
	CZmK9zXAsw3lR7A41paTyJM1ta7npUWtKbW9ib148vGoVvrhw58sY5F4kQZSTZTvpymtfwyzoHb7j
	2BPMtPaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQGMT-0000000HG3e-1B7w;
	Mon, 09 Nov 2026 03:48:01 +0000
Received: from mail-ot1-x32d.google.com ([2607:f8b0:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQGMP-0000000HG0t-1B0j
	for linux-riscv@lists.infradead.org;
	Mon, 09 Nov 2026 03:48:00 +0000
Received: by mail-ot1-x32d.google.com with SMTP id 46e09a7af769-84e513874f8so288406a34.2
        for <linux-riscv@lists.infradead.org>; Sun, 08 Nov 2026 19:47:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794196076; cv=none;
        d=google.com; s=arc-20260327;
        b=GucJaOpjvDwJ/u5BC67UYkbd/DVysgduVqNJNVwPWzGjrkWI+EARrU3s3a8gPJnU31
         ceuuiiovUkldUz4N6Y13cOydfdgx5N1dfCCFyVcVU+r3o9825UnhiYXEuc9TvkBXjpxu
         SCXh1ILHT1u5lJpxyoaCL4JSapA+ekmh8klmidvM98lrhhFO25Lnjhr4xZelW8IZ4Lha
         pl8P1Bydqd36dMmLpw9QAr42qG3px97H1ZNb5twKsuLbdzUo/Fmi1VzzA0Q8J4jzg3J0
         5XRQ8dztpDSzLFXnrzY6ksHaRdwq98CDNB6yyT2Sx+1gbNlIH8zFQzD9W9nUP7yHiVsj
         PA7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=02Xm4AXZtFCOeYUfXGvoHJuZWiU3qVVXajNv+02pe2I=;
        fh=0Ho2DBtETis19aCEPO9kw5g9Bxkw4s1XUZkprtSQU7U=;
        b=Qf2TwTUcrXBUAQrNfMt3rqYKWQzJcPel15IqRP3uScpNsSKqcQbeY4+21bOV1L/21E
         bd30kutl7qctR36VOqrh4R7Ndq9c4/eSY4oPnmUl89tPjzdUPLo40phBfRcVn2wHuoGh
         kKRjLWz4ytPycaI+NYCGoKLLIJQFkeUFSMZHYqje7I8pY96D/ebMy4jH8OsbIct+cSAX
         nkj+avQrmV6ROwqMcL+4+F/9nIIl2L//wa8Eqald5PhGw4lAPvrvNWJU6hvLYjFAS0Y3
         YT+mPLmdPkYdi3DAI4YUwMSjB4hhWRXsXq2/bYJEBaq+7h3hDhb56IIl3Dp5E1Pi6vBZ
         nLRw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1794196076; x=1794800876; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=02Xm4AXZtFCOeYUfXGvoHJuZWiU3qVVXajNv+02pe2I=;
        b=Zf+cx80GrgpvVrYc24cmPaKu/g/02egpBj2KZ56PzujbCFipecJY8yynlHjqNIwM6+
         I5twk6SdzlaqXV6v0GU/tN3jLFiUpIphtC3BPU5NiMKeQh2g3yPF7ZNw8FtReulukILY
         QXIZubWyJynQId6VtgP7IhPGmKtRZjPm0ePuwLsqaWvcArOdoOE275NCJU4IMBOGwJoE
         KqWg4pBJ2gCkNpAW1D/Lp75HrC2qTZtzvuLPArrOJ7BaQ8fwn3VkCda3TL8sdtghbPxB
         wVkg+czKvZECX/An0YcTHJwsf+uGh/LLF7QAGM6LVGF1XdbWWhi17DKWCKi6z3yr5AGH
         MvMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794196076; x=1794800876;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=02Xm4AXZtFCOeYUfXGvoHJuZWiU3qVVXajNv+02pe2I=;
        b=Cc5mJwknINnyHhE28EJbrXRZaV89lqipckikrTfdv5edziSDHqiyEFsY0VyDnlIN4v
         9FRXtNcamuHsHbkKg1Ml+WDTQFJKSMYvSrROUJ6MpJvIobec2p5xZ0Vqwlp32g62okw6
         J8u9s4QuXU5O1hB5kVMz1ag8J0/he7MgNSDJHd+yjRl/Z6/byOhuMRaphLZ3smXwL1u8
         lP/0sVQ13xB2N5RMo9G5n+5LlrGbm989jCYHTEYu8hhFEfJctG0yUhDPaIm7kGpd3UBu
         URFqtqXn7F6YzYczIGMWhvYtwfzZcyaq5VvLvEdJMI2RPctfakFxiwL0lPZ/KPzFqXYl
         8V/Q==
X-Forwarded-Encrypted: i=1; AL+hErEQ5yM9zmope7MhyUdRiO22KxLPDpRpkuBHndVY2QkkWFj2gwHtjIYHVpjAQ7VFellRHWmDwdPqWWc7SA==@lists.infradead.org
X-Gm-Message-State: APuU4Z+07nwC5Ew1OXoXJMSwBB8o+Oh/TwyLh4Xnwc1be6/w0hzC6/8I
	AoBSVWfZ2c52egPEMVVaGdbGED1+OHSxFVHmOBaj0YJJ4GesbbneedZdmiSQoiaXR23mlMS4tET
	pKOwTmGPuwn58XLt1ik/XzVLPczKus3ZnsC10NU6VNQ==
X-Gm-Gg: AYBFou09Lr+Vrheq3asIqVoOcY8EdSQ7dHQaiR+eJiVBNJzl2CnFzyrgJk0REV1ONyW
	hnCrM2DbNVqxy3o0G8+wnP8233s58xSVlnZg6elVcuYMdvUXpkw0gx2f3gBd2zmIDzgWB274LNa
	iCxNWqohJ3eCLxuMtai3ruLFVNmR/Gg2dL6NF4IoKcMJWOP7jGeUxy2GKVKzIWGTRUhMq7emAvE
	QTCCrA4rH1FFYK1IRrX6kRRF8TNPYBOueLAkrPzbjYRNLHQKSasO+SYBPhgT9rQV5u5E9CpTTaB
	pc55kzCA/CIyHAYKnWWIgcQB8YMyZvQRaT0YzXZwTwW9to1f7DfP1irWqt0TsJPWjyPVzf8V1Xz
	Os6OucXvRe6IllwpuJ+O/vdCPDM55L8XzbLyuvh4G1Nk=
X-Received: by 2002:a05:6830:3115:b0:81e:abb6:7498 with SMTP id
 46e09a7af769-85f5082de7dmr2762199a34.23.1794196075840; Sun, 08 Nov 2026
 19:47:55 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261108110406.97495-1-cuiyunhui@bytedance.com>
 <20261108110406.97495-2-cuiyunhui@bytedance.com> <20261108213254.67805ef0@pumpkin>
In-Reply-To: <20261108213254.67805ef0@pumpkin>
From: yunhui cui <cuiyunhui@bytedance.com>
Date: Mon, 9 Nov 2026 11:47:43 +0800
X-Gm-Features: AclHuK9B61ylAVcWnUjeFJuyJwDuHE_2RuMPKX9QRnbJ_mu0Y53s1C9cYNJl2lY
Message-ID: <CAEEQ3w=5QwwvMJFJkpS51APoBjhed6oriCkvcieRdUFWrKtmSg@mail.gmail.com>
Subject: Re: [External] Re: [PATCH v9 1/3] riscv: implement this_cpu operations
To: David Laight <david.laight.linux@gmail.com>
Cc: pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, 
	dennis@kernel.org, tj@kernel.org, cl@gentwo.org, ast@kernel.org, 
	daniel@iogearbox.net, andrii@kernel.org, martin.lau@linux.dev, 
	eddyz87@gmail.com, memxor@gmail.com, song@kernel.org, yonghong.song@linux.dev, 
	jolsa@kernel.org, bjorn@kernel.org, pulehui@huawei.com, puranjay@kernel.org, 
	thuth@redhat.com, ajones@ventanamicro.com, ben.dooks@codethink.co.uk, 
	rkrcmar@ventanamicro.com, samuel.holland@sifive.com, zong.li@sifive.com, 
	conor.dooley@microchip.com, tglx@kernel.org, debug@rivosinc.com, 
	seanwascoding@gmail.com, andybnac@gmail.com, menglong8.dong@gmail.com, 
	cyrilbur@tenstorrent.com, wangruikang@iscas.ac.cn, atishp@rivosinc.com, 
	apatel@ventanamicro.com, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, bpf@vger.kernel.org, 
	arnd@arndb.de, nathan@kernel.org, nick.desaulniers+lkml@gmail.com, 
	morbo@google.com, justinstitt@google.com, qingfang.deng@siflower.com.cn, 
	linux-arch@vger.kernel.org, llvm@lists.linux.dev, dave@stgolabs.net, 
	emil@etsalapatis.com, ihor.solodrai@linux.dev, broonie@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261108_194757_378475_2A9FB8AE 
X-CRM114-Status: GOOD (  14.45  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

SGkgRGF2aWQsCgpPbiBNb24sIE5vdiA5LCAyMDI2IGF0IDU6MzPigK9BTSBEYXZpZCBMYWlnaHQK
PGRhdmlkLmxhaWdodC5saW51eEBnbWFpbC5jb20+IHdyb3RlOgo+Cj4gT24gU3VuLCAgOCBOb3Yg
MjAyNiAxOTowNDowNCArMDgwMAo+IFl1bmh1aSBDdWkgPGN1aXl1bmh1aUBieXRlZGFuY2UuY29t
PiB3cm90ZToKPgo+ID4gUklTQy1WIGhhcyBubyBhc20vcGVyY3B1LmgsIHNvIHRoaXNfY3B1Xyoo
KSByZWFkLW1vZGlmeS13cml0ZQo+ID4gb3BlcmF0aW9ucyB1c2UgZ2VuZXJpYyBpbXBsZW1lbnRh
dGlvbnMgdGhhdCBkaXNhYmxlIGxvY2FsIGludGVycnVwdHMuCj4gPgo+ID4gSW1wbGVtZW50IFJJ
U0MtVi1zcGVjaWZpYyB0aGlzX2NwdSBvcGVyYXRpb25zIHdpdGggcHJlZW1wdGlvbiBkaXNhYmxl
ZAo+ID4gdG8ga2VlcCBhY2Nlc3NlcyBvbiB0aGUgY3VycmVudCBDUFUuCj4KPiBIYXZlIHlvdSBs
b29rZWQgYXQgc29tZSBvZiB0aGUgc2NoZW1lcyAoSSB0aGluayBhcm02NCBoYXMgdGhlIGxhdGVz
dCwKPiBidXQgYWxzbyBzMzkwKSB0aGF0IGRvIG1vc3QgcGVyLWNwdSBvcHMgd2l0aG91dCBkaXNh
YmxpbmcgcHJlZW1wdGlvbi4KPiBJbiBwYXJ0aWN1bGFyIHRoZXkgc2F2ZSB0aGUgcHJlLWVtcHRp
b24gY2hlY2sgd2hlbiBwcmUtZW1wdGlvbgo+IGlzIGVuYWJsZWQuCj4KPiBCYXNpY2FsbHkgdGhl
IGNvZGUgdGVsbHMgdGhlIHNjaGVkdWxlciB3aGljaCByZWdpc3RlciBjb250YWlucyB0aGUKPiBw
ZXItY3B1IGRhdGEgc28gdGhhdCBpdCBjYW4gYmUgJ21hZ2ljYWxseScgZmxpcHBlZCBkdXJpbmcg
YSBjb250ZXh0Cj4gc3dpdGNoLgoKTWFueSB0aGFua3MgZm9yIHBvaW50aW5nIHRoaXMgb3V0IGFu
ZCBzdWdnZXN0aW5nIHRoaXMgb3B0aW1pemF0aW9uLiBUaGlzCmlzIGEgdmVyeSB1c2VmdWwgc3Vn
Z2VzdGlvbi4gSW4gdGhlIGNvbW1vbiBjYXNlIG5vIHByZWVtcHRpb24gb3IgbWlncmF0aW9uCm9j
Y3Vycywgc28gdGhlIHByZWVtcHRpb24gYm9va2tlZXBpbmcgYW5kIHJlc2NoZWR1bGUgY2hlY2sg
YXJlIHVubmVjZXNzYXJ5Cm92ZXJoZWFkLgoKSW1wbGVtZW50aW5nIHRoaXMgc2NoZW1lIGZvciBS
SVNDLVYgd2lsbCByZXF1aXJlIGFkZGl0aW9uYWwgY2hhbmdlcyBiZXlvbmQKdGhlIGN1cnJlbnQg
c2VyaWVzLiBJZiB0aGlzIHNlcmllcyBpcyBvdGhlcndpc2UgYWNjZXB0YWJsZSwgSSB3b3VsZCBs
aWtlCnRvIGxhbmQgdGhlIGN1cnJlbnQgdGhpc19jcHVfKiBzdXBwb3J0IGZpcnN0IGFuZCB0aGVu
IHByZXBhcmUgYSBmb2xsb3ctdXAKc2VyaWVzIHVzaW5nIHRoaXMgYXBwcm9hY2guCgpUaGFua3Ms
Cll1bmh1aQoKPgo+IERhdmlkCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXJpc2N2Cg==
