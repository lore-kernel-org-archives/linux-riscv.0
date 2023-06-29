Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18146EB64D7
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Jun 2023 01:38:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wSpJWx8zsQUpnMXAlIzq3OecK6WEbg6o+4NJ5VsiV+c=; b=DL1RpR9wqMgc27
	zwSR/pmhAIHfxKZuvKpR0APWbuonIR9f0IyRFtk3gPJxE7Eqi3Ks8e1FZXHr3AWnPfGzrdjzKuMhf
	vYmXyJa/Gt8M/Z+65lk56gX4RlF/Jwq0vbNXucY9MXomlO4IXBG982U5aKL9CWK/fZOcJJb7tFAv+
	AO75DbmJ2jzvutLhhfgNy+y3UNwFssoGxMNud0hgmbMLzaBLds/nQMoR9DkJK8FVs48bi3HZGP0Od
	VJ1pLpjYBrnnmlQWs6b7bY8CH8mX7ZTI4rRUDtb8z8LrrJSC9LImDQF6CbQJWS13UlGHeFQSR1+6w
	3O5C/t4cBc0cHD36Njzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qEgcA-00HFo4-1k;
	Thu, 29 Jun 2023 01:38:30 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qEgc7-00HFmm-1o
	for linux-riscv@lists.infradead.org;
	Thu, 29 Jun 2023 01:38:29 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-1b7f9d66812so1662635ad.0
        for <linux-riscv@lists.infradead.org>; Wed, 28 Jun 2023 18:38:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1688002702; x=1690594702;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=oTkD0d6a9ryiTvtazmiArPDTMy644oSqj+e8VQliv+Y=;
        b=KpJvJ8jTi0MYXdSPmYdS2cWuT55tn80Cox9G2xRB90uAn5H8xsr6sSgb2Jo1YcreBT
         lPxMFbCj5knzwuvCX4HsvoU27uF8PumefIrT7pgGEc7TuZmDZthy8YejthW5JotaZ8j1
         YIJ+m7XpeHokGhV/X8hi4HCVO38ZFYbLHr3aCYcrWcvq+lv+//ZUp4jnoZgJITetIuf/
         5KtwK8enoBIZNPm80Rozgwc91uqpnR7whP+cppW8ZGEt6rH7egLHPp56RShF1aPkiBS/
         xrcv6xhcH6TOnOOrBWQr1GBrII1Z9qItEF9ajAQpmaIQP74D5uQDTj6gcTPYZyAs15te
         7MgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688002702; x=1690594702;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oTkD0d6a9ryiTvtazmiArPDTMy644oSqj+e8VQliv+Y=;
        b=B1P6L+HYCsDa2TLLTaZL1WOehn8WquCQBepoYskpBN5508f47espwN97PXTTFR9vP7
         jR1PNLpi8MKv3AJBY7c006CKwwHJXr/jTz15NfViRAvBaqzFoLaxx4MECmzeFPmF4uCU
         Q5LRrB1vEQeEQRbLo9SwwVOvOPeCbEW6KkDIX1x3vW1Ay6S1WDz0zlqU4SqxKJHsC/0B
         OHetqIuk/U2sA6hi+aQrBcORqH42LOkGRazD5fabrAkB1kQ3LuRwsrjctZDDqPRq4h5U
         +DM2vvHHH6BsEtjY7Egv2uST8em0KzQ5XfVoSb8pkBXi4ZptsZXFq5/EMxAZSXb8hoIF
         2keA==
X-Gm-Message-State: AC+VfDy59hpJTdy4pt1fxCBxEPe6a5aE4xLCExRjkuCMf6NMqhJQiKuY
	P4puzjG9Nbj0OcdFSGQsZbTKTQ==
X-Google-Smtp-Source: ACHHUZ4vNfduTE+k0DVsS2q3rr0HoQZvJdXf5nxbxIoAWfAIpvWokoxLXXHfyfVQ9d7RUkGEoHJiPQ==
X-Received: by 2002:a17:903:22cf:b0:1b8:16c7:a786 with SMTP id y15-20020a17090322cf00b001b816c7a786mr9241423plg.4.1688002702392;
        Wed, 28 Jun 2023 18:38:22 -0700 (PDT)
Received: from ghost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id f4-20020a170902e98400b001b53029fef1sm2145668plb.172.2023.06.28.18.38.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jun 2023 18:38:21 -0700 (PDT)
Date: Wed, 28 Jun 2023 18:38:19 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: Anup Patel <anup@brainfault.org>
Cc: Jessica Clarke <jrtc27@jrtc27.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Atish Patra <atishp@rivosinc.com>, Conor Dooley <conor@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@rivosinc.com>,
	Albert Ou <aou@eecs.berkeley.edu>, bjorn@rivosinc.com,
	Evan Green <evan@rivosinc.com>,
	linux-riscv <linux-riscv@lists.infradead.org>,
	konstantin@linuxfoundation.org, linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH 1/2] RISC-V: mm: Restrict address space for sv39,sv48,sv57
Message-ID: <ZJzgi8RyqG3Mjt0R@ghost>
References: <20230627222152.177716-1-charlie@rivosinc.com>
 <20230627222152.177716-2-charlie@rivosinc.com>
 <473F7474-D7AA-4C9F-95A3-320F1741EC50@jrtc27.com>
 <ZJtzEn9Yut3nPuw8@ghost>
 <CAAhSdy2MVu986VUUVTaY6K+s75-MpDoQvsi_jOVZWrCZq8WE2g@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAAhSdy2MVu986VUUVTaY6K+s75-MpDoQvsi_jOVZWrCZq8WE2g@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230628_183827_604223_92E5C9A0 
X-CRM114-Status: GOOD (  21.62  )
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

T24gV2VkLCBKdW4gMjgsIDIwMjMgYXQgMDY6MDQ6NDFQTSArMDUzMCwgQW51cCBQYXRlbCB3cm90
ZToKPiBPbiBXZWQsIEp1biAyOCwgMjAyMyBhdCA1OjA54oCvQU0gQ2hhcmxpZSBKZW5raW5zIDxj
aGFybGllQHJpdm9zaW5jLmNvbT4gd3JvdGU6Cj4gPgo+ID4gWWVzIGl0IGlzIHNtYWxsIHRvIGhh
dmUgYSBkZWZhdWx0IG9mIDM4LWJpdHMgb2YgdXNlcnNwYWNlLiBJIHdvdWxkIGJlCj4gPiBpbnRl
cmVzdGluZyBpbiB0aGUgb3BpbmlvbnMgb2Ygb3RoZXIgcGVvcGxlIG9uIHdoZXRoZXIgaXQgd291
bGQgYmUKPiA+IGFjY2VwdGFibGUgdG8gaGF2ZSB0aGUgZGVmYXVsdCBiZSBzdjQ4IGFuZCByZXF1
aXJlIGFwcGxpY2F0aW9ucyB0aGF0Cj4gPiBwcmVmZXIgZmV3ZXIgYml0cyB0byBzcGVjaWZ5IHNv
IHdpdGggdGhlIGdpdmVuIG1tYXAgaGludGluZy4KPiAKPiBJIHRoaW5rIHN2NDggaXMgYSByZWFz
b25hYmxlIGRlZmF1bHQgaW5zdGVhZCBvZiBzdjM5LiBXZSBzaG91bGQgZmFsbGJhY2sKPiB0byBz
djM5IG9ubHkgaWYgdGhlIHVuZGVybHlpbmcgaG9zdCBkb2VzIG5vdCBzdXBwb3J0IHN2NDguCj4g
Cj4gUmVnYXJkcywKPiBBbnVwCgpJIGRpZCBzb21lIHJlc2VhcmNoIGFuZCBpdCBhcHBlYXJzIHRo
YXQgSmF2YSBkb2VzIHdvcmsgb24gc3Y0OCwgYnV0IG5vdApvbiBzdjU3LiBVc2luZyB0aGUgdjYu
NCBrZXJuZWwgSSB3YXMgYWJsZSB0byBzdWNjZXNzZnVsbHkgcnVuIE9wZW5KREsgb24KYm90aCBz
djM4IGFuZCBzdjQ4LCBidXQgb24gc3Y1NyB0aGVyZSBpcyBhIFNJR1NFR1YgZXJyb3Igb24gUUVN
VS4KUmVsZXZhbnQgSkRLIGRpc2N1c3Npb24gY2FuIGJlIHNlZW4gaGVyZSAKaHR0cHM6Ly9tYWls
Lm9wZW5qZGsub3JnL3BpcGVybWFpbC9ob3RzcG90LWRldi8yMDIyLU5vdmVtYmVyLzA2NzI5OC5o
dG1sLgpHbyBzaW1pbGFybHkgYXBwZWFycyB0byB3b3JrIGV2ZW4gb24gc3Y1NyBhY2NvcmRpbmcg
dG8gaHR0cHM6Ly9nby1yZXZpZXcuZ29vZ2xlc291cmNlLmNvbS9jL2dvLysvNDA5MDU1LgpJIGhh
dmUgbm90IHRyaWVkIEdvIG15c2VsZi4gCgpUaGUgcG9pbnQgb2YgY29udGVudGlvbiBoZXJlIEkg
YmVsaWV2ZSBpcyB0aGF0IGluIHY2LjQsIHRoZSBoaWdoZXN0CmFkZHJlc3Mgc3BhY2UgYXZhaWxh
YmxlIHdpbGwgYmUgdXNlZCwgY2F1c2luZyBhbGwgb2YgdGhlc2UgYXBwbGljYXRpb25zCnRoYXQg
ZG8gbm90IHdvcmsgcHJvcGVybHkgaW4gc3Y1NyB0byBmYWlsIHdoZW4gdGVzdGluZyBpbiBzdjU3
CmVudmlyb25tZW50cy4gR2l2ZW4gdGhhdCB0aGVzZSBhcHBsaWNhdGlvbnMgc2VlbSB0byB3b3Jr
IGluIHN2NDgsIGl0CnNlZW1zIHJlYXNvbmFibGUgdG8gZGVmYXVsdCB0byBzdjQ4LCB1bmxlc3Mg
dGhlcmUgYXJlIGFuIGFidW5kYW5jZSBvZgphZGRpdGlvbmFsIGFwcGxpY2F0aW9ucyB0aGF0IGFy
ZSB1bmhhcHB5IHdpdGggdGhpcy4KClVzaW5nIHRoZSBoaW50IG1lY2hhbmlzbSB0byBtbWFwIHdp
bGwgdGhlbiBhbGxvdyB1c2VycyB0byBjaGFuZ2UgdGhlCmFkZHJlc3Mgc3BhY2UgdG8gc3Y1NyBp
ZiByZXF1aXJlZC4gSXQgc2hvdWxkIGJlIHBvc3NpYmxlIHRvIGFsbG93IHVzZXJzCnRvIHVzZSBz
djM4IGlmIHRoZXkgbmVlZCBpdCB1c2luZyB0aGUgc2FtZSBtZWNoYW5pc20sIGJ1dCByZWR1Y2lu
ZyB0aGUKYWRkcmVzcyBzcGFjZSBpbnN0ZWFkIG9mIGdyb3dpbmcgaXQgd2lsbCByZXF1aXJlIG1v
cmUgdGhvdWdodCBmcm9tIG1lIHRvCmltcGxlbWVudC4KClRoYW5rcywKQ2hhcmxpZQoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFp
bGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
