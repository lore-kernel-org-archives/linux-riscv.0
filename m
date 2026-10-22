Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A014606A319
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Oct 2026 05:21:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=zPrtVPgW;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=brainfault.org header.i=@brainfault.org header.a=rsa-sha256 header.s=google header.b=jlCYEnO5
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fG0ZmxsyYb880sHmN1326DymemvvPJX5QzzJNHile6Q=; b=zPrtVPgWvWFWj1
	g5jLnyV5dXqeq3At4aeBAgKjODSdg8Zl6SgvkYyRceqIo6GqWBdk1orYZl3AdO1ZUeVA7+pgIeSHB
	WjLRSwo1BpKHpPCqxhaUMo+oYBqRwQxw2AADdNA9jQE55nEYE2CSE58DqlMfvfrtuSURkRp523D2K
	p7Q9Xs3AsQJNFFLtF7Px0Xynl+O0c65bC/NQv2bVDjPorgmNB1+o+QeNIFr+Buh5hBDwuzNEbjR85
	swofChEPu2KPCj3ZnRynTVDv0dmQz+tCK9vlqpdXz2I94ZpQKclQkFoEEmDR598hLd+XhfiAiyDBK
	BPIL9PdDNiJllhSduwbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJlEP-0000000DNO0-1iiJ;
	Thu, 22 Oct 2026 05:20:49 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJlEM-0000000DNMO-10wl
	for linux-riscv@lists.infradead.org;
	Thu, 22 Oct 2026 05:20:48 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-48c4d99c32bso1056517f8f.1
        for <linux-riscv@lists.infradead.org>; Wed, 21 Oct 2026 22:20:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792646444; cv=none;
        d=google.com; s=arc-20260327;
        b=ngXoVQg90HmE807Z2aMfdZOe2rcyC6JtL9tuxecjMbWQuRVu2YEmtTctHHY+xouKsP
         yMEG8LNmzg32ASgMlPGNYpamiuaazb2NA9oXg0Tc7nE8fzLfrCTlNM6eYO2Gdca6NHru
         fnRyC2qmGt2Ok1rPq98kw47mhwZdFFTDQkiYm8hq/QED75mE1WsmTXwUEe9x+32/tlDR
         r2zd7o8l09kfTDQD2saeIJdIv2e1ehWVWmRrWafUjqcHmbC53wMd8OvCG1Z5YnYM2amA
         s9iDnw4W4CmM8iDqSdV7t8m8vJGgiLmSp6F24t0b0azFy5UjTSa2YxFBNqdZoWCuLDMw
         IGbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5dV8J2o+756ExcNaGq9topEd2CgNZBpheBIgCfX69Gs=;
        fh=2Q9GUawcqJJcptAvWEsNnxGIWwnDagtBXgTTEQsOI+U=;
        b=pMpP0LmykoKtDo9Am+gUiM6sWCB3F/pIVjTgfrNIJ7EZEdE/BCZABSHV0GyYdPNakL
         25xJ42+1Am1oLO1hp1lsl6JCDUnChQ3At/lw7I3hNUS5Oo9fzKy7VEIiKuywng4j+k6t
         LAas5/OMihNsFO+3URxFwVXHrTH55jvGdLyP3lLUiVadpc5vvOySsPe8WBQxUS5VlI8t
         5tkBz3PgFg6Q0FT7MOxIVK9cxhDxgJVtTgUZCBgdqdFZks9JL6isobhYqTbCZzQoZCKs
         DJMJwr2aw7/Hzy7DP8E8uyQvcRK/r2W0AdUlAetQQel52WaYc8kNkJmP0hS0uADJPhNB
         911w==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1792646444; x=1793251244; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5dV8J2o+756ExcNaGq9topEd2CgNZBpheBIgCfX69Gs=;
        b=jlCYEnO5ODRdBu/xbtRLzkSIV4o9X8xGIrQN6l43dLoP//eJA6horHGe+pwq8gv1Pb
         cETuis6ELcpSYKJmCYAqqoC4OS+v2LSEToyVuhOGPFvk7B+DJss48PywPA52py5z1dxh
         /bCHQw9XoHht8E376AqBjOtZkB2UXDAa3Cz7kSTqO0hJChajDD+2WZlZXWoX1HWkrtaF
         RQJo9a4Yr7m+SgF7h5KKKHV9Jz4EGhikxOEfuk1ryudbeE9wVyvMz319ntEQYRPe2JKg
         d77hsfWOazC9OHA/LhZBegO94KfVSMOaF+eTcGDYy1AP4cUAxYQofjr0jeXCV159dHg6
         g2Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792646444; x=1793251244;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5dV8J2o+756ExcNaGq9topEd2CgNZBpheBIgCfX69Gs=;
        b=av1iClfRoVNlO158qWzhs45CU8xtp4HWlnsgrzD8qDF7+bkppPPrC0VbDbAWWJfIi9
         ta5wz0N4R1IatgzC9NTZI/fC6cJsyZG0tk0wysPRT5LZ9N8fmT17Gow+vs0NptF7HnGh
         smz01TM+gZBz7Hd/3Se+zkC/YAQiRZY7gsYe1P9T6XCUx3pkWlnXm1+nbTpnup+An69C
         ZwVC8iDMkp2dI50LEEOtjZXY2tcq9fU3g5V2akSFkBeG5G1DfHr2NXApUB+GdAfa3dlw
         pWn1hEhivZbJc3m89XhbtoDeX8Y8fGhh9lPYmTrDkAFspMhkfa322nHT8mTKMLpMM1Yn
         KvNg==
X-Forwarded-Encrypted: i=1; AKwUvBwnTqIT3KoprIFuAG7sQPl2rBYSkgh0qK09GtCj3wJ+4AgFIe3Shb5efybl04HI+l7NqKyl7P31jLKV4Q==@lists.infradead.org
X-Gm-Message-State: AFq9FYIelaoR4xxFeEW3UofzI9KL2/n4BKfuKI8H12jIn/Kq8DSEuhow
	tLOsHW+8bQDIH29TtpejVW209kQDvfCJGVCfearc5wSXI95Liu5/DcikDOoV7EEQjoaYWlg7UPq
	0fC1xdtHTxbnkELKqjDGF0hnECVUl8vHbg9ItUb2l6g==
X-Gm-Gg: AYBFou0nKk10zV6FDk8t2ESaw6tSLHARCERW8OI62cY3FKnGLZG2tUW0a18QI5ZHfxQ
	6Lyk6AknCW1OcNGmTTwy4IxDnPAsNRf4p7usoEtNLXij4F0oG3d+Vpd4CkBTf+BvEhV1NWEF6AD
	L6/K2IumkxzvijyxdiV7x4TJhvGbmOKauIyXVkzBj9ditAxzC5rJpUKK4PPgBZ8qLJ+JaS6XbOq
	K2fDZechgk504dqcVAgm/+DA/Rja2APg7LgCeZF+Xe6kxzohWvamdti1kkr3QmgcnUDqsdNHYTO
	VFXS8kchQe3YaVfqgDCXx3h0BwBgXi39AeAVFxPRcV22RX3NXMdwXH7Pbojq9uyNVFWAzfMXQsd
	6/Ul4y7F7WcChsfZRf001dwSXP5rgcJ66GHTW8n+Ov212xFtxVDkkiHHVBsKtQQugatMrqbPBHL
	gz0PMmNsLadbtALi3XwJda4AfAvsHwt0qChQ4m0pFa8xpZAffARw1cv1twNHyulgFtLxwmW0GnR
	PCjLw==
X-Received: by 2002:a05:6000:4025:b0:48d:c29e:40c3 with SMTP id
 ffacd0b85a97d-48e264bdcd8mr8669565f8f.33.1792646444331; Wed, 21 Oct 2026
 22:20:44 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261019134709.2610129-1-andrew.jones@linux.dev> <atZPqGKEip_sW3fr@orel>
In-Reply-To: <atZPqGKEip_sW3fr@orel>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 22 Oct 2026 10:50:32 +0530
X-Gm-Features: AclHuK8Srkuid1EQZ7HZGvxQuXz3bcbCHVgrlN5FrFRdxoTbUp0B6JefKaok7ws
Message-ID: <CAAhSdy0KvbHT6iShPfMkhePP0V2cVohv6WcHWieWLwZYqkFnjg@mail.gmail.com>
Subject: Re: [PATCH v2] RISC-V: KVM: Convert IMSIC vsfile_lock to a raw spinlock
To: Andrew Jones <andrew.jones@linux.dev>
Cc: kvm-riscv@lists.infradead.org, atish.patra@linux.dev, pjw@kernel.org, 
	palmer@dabbelt.com, kvm@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_222046_290004_2171F616 
X-CRM114-Status: GOOD (  15.20  )
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
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gTW9uLCBPY3QgMTksIDIwMjYgYXQgMTA6NDbigK9QTSBBbmRyZXcgSm9uZXMgPGFuZHJldy5q
b25lc0BsaW51eC5kZXY+IHdyb3RlOgo+Cj4gT24gTW9uLCBPY3QgMTksIDIwMjYgYXQgMDM6NDc6
MDlQTSArMDIwMCwgQW5kcmV3IEpvbmVzIHdyb3RlOgo+ID4ga3ZtX3Jpc2N2X3ZjcHVfYWlhX2lt
c2ljX3B1dCgpIHJ1bnMgZnJvbSB0aGUgc2NoZWR1bGVyIHByZWVtcHRpb24KPiA+IG5vdGlmaWVy
IHdpdGggdGhlIHJhdyBydW5xdWV1ZSBsb2NrIGhlbGQsIHNvIGl0IG11c3Qgbm90IHRha2UKPiA+
IHZzZmlsZV9sb2NrLCBhbiByd2xvY2tfdCwgd2hpY2ggc2xlZXBzIG9uIFBSRUVNUFRfUlQuIEFs
bCB2c2ZpbGVfbG9jawo+ID4gY3JpdGljYWwgc2VjdGlvbnMgYXJlIHNob3J0LCBzbyBhIHJhdyBz
cGlubG9jayBpcyBmaW5lLgo+ID4KPiA+IEZpeGVzOiA0Y2VjODlkYjgwYmEgKCJSSVNDLVY6IEtW
TTogTW92ZSBIR0VJW0V8UF0gQ1NSIGFjY2VzcyB0byBJTVNJQyB2aXJ0dWFsaXphdGlvbiIpCj4g
PiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXcgSm9uZXMgPGFuZHJldy5qb25lc0BsaW51eC5kZXY+Cj4g
PiAtLS0KPiA+IHYyOgo+ID4gIC0gQ29udmVydCB2c2ZpbGVfbG9jayB0byByYXdfc3BpbmxvY2tf
dCBpbnN0ZWFkIG9mIGFkZGluZyBhIHNlcGFyYXRlCj4gPiAgICBoZ2VpX2xvY2sgW0FudXBdCj4K
PiBIaSBBbnVwLAo+Cj4gU2FzaGlrbyBmb3VuZCBhbiBBQkJBIGRlYWRsb2NrIHdpdGggdGhpcyB2
MlsxXS4gTWFraW5nIHZzZmlsZV9sb2NrCj4gZXhjbHVzaXZlIHNlcmlhbGl6ZXMga3ZtX3Jpc2N2
X3ZjcHVfYWlhX2ltc2ljX3B1dCgpLCB3aGljaCBydW5zIHVuZGVyCj4gcnEtPl9fbG9jaywgYWdh
aW5zdCB0aGUgU1ctZmlsZSBpbmplY3QgcGF0aHMsIHdoaWNoIGtpY2sgdGhlIHZDUFUKPiAocGlf
bG9jay9ycS0+X19sb2NrKSB3aGlsZSBob2xkaW5nIHZzZmlsZV9sb2NrLiBMb2NrZGVwIGNvbmZp
cm1zIGl0IHdpdGgKPiBhbiBFTVVMIG1vZGUgZ3Vlc3QsIGFuZCB0aGUgaG9zdCB0aGVuIGhhbmdz
IChJIHNob3VsZCBoYXZlIHRlc3RlZCB3aXRoCj4gRU1VTCBiZWZvcmUuLi4pLiB2MSBkb2Vzbid0
IGhhdmUgdGhlIHByb2JsZW0sIHNpbmNlIGl0cyBoZ2VpX2xvY2sgbmV2ZXIKPiBoYXMgYW55dGhp
bmcgdGhhdCB3YWtlcyB0YXNrcyBuZXN0ZWQgdW5kZXIgaXQuIEkgdGVzdGVkIHYxIGluIGJvdGgg
RU1VTAo+IG1vZGUgYW5kIGh3YWNjZWwgbW9kZSBbYWdhaW5dIHdpdGggbG9ja2RlcCBhbmQgaXQn
cyBnb29kLgo+Cj4gU2hvdWxkIHdlIHRha2UgdjEgaW5zdGVhZD8KPgo+IFsxXSBodHRwczovL3Nh
c2hpa28uZGV2LyMvcGF0Y2hzZXQvMjAyNjEwMTkxMzQ3MDkuMjYxMDEyOS0xLWFuZHJldy5qb25l
c0BsaW51eC5kZXY/cGFydD0xCj4KCk9rYXksIHdlIHdpbGwgZ28gYWhlYWQgd2l0aCB5b3VyIHYx
LgoKUmVnYXJkcywKQW51cAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1yaXNjdgo=
