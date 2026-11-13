Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36F62606A321
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Nov 2026 06:30:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=sTu0Plzx;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault.org header.i=@brainfault.org header.a=rsa-sha256 header.s=google header.b=rQkC8vsH
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=HJqO0nG5HrwnU0G5VpZb0CsubZnCe4rGWktd600qddY=; b=sTu0Plzxb+BTq6n+VORXdMm/67
	9q+Y8vKbMiLgZJO+629/QM68ZLm1iH5t4d18n1pEHH3D2lkpNbXTJe8dx+idVFrB6AhyCdnpN8Zlz
	R35X+IaS5XqZ4Hlw4AoULn02vfIETIv5TWFy6x/lRk7lgh/y6xEXwHWYPOAVDKdYQ9pMzyc3RDG8n
	VbStrg5ezLl4R+ZhSM/qcY96rGmYLPBS/vjfMZm5qpch1Yly2sQ2paIjc0iSpKIBvbnugy2vgrz4b
	QJdN9v4l0u7x/uOThQ//iqTYtj25vDVZhTt7yLlYgYW9so4Etxo8tl6UW7HUEsItq2sDN6WfzmfDq
	zfWhGyjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRkng-0000000BmIo-3sP6;
	Fri, 13 Nov 2026 06:30:16 +0000
Received: from mail-lj1-x22e.google.com ([2a00:1450:4864:20::22e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRknd-0000000BmHS-4184
	for linux-riscv@lists.infradead.org;
	Fri, 13 Nov 2026 06:30:15 +0000
Received: by mail-lj1-x22e.google.com with SMTP id 38308e7fff4ca-3ad0102edd4so7660901fa.1
        for <linux-riscv@lists.infradead.org>; Thu, 12 Nov 2026 22:30:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794551412; cv=none;
        d=google.com; s=arc-20260327;
        b=D7cKJzwYOtDYs9wHfBwYy+2GPdv8pC9CPy9TlUSWKCFY77fnp/assk53vlT+g9IDel
         8BTlycjtHyhUV3ODuxnJPpQZRsxDu25mkXkL8wUL6JPDRZA7w+zneyYThi8FPk5NUHzZ
         dEyUIYZEFXacS0bzgMR9GlPbrm0HTcnZUe2SnE5fkiyVx4D/0gSS/ZbFF6Sh5fSH26Zc
         UPi1ZhzS6zxX/X6ZFneBjuqCNEvzd17QENUR5UvxWOqLItYpXiDRPyQOEkm7c/hBq7uB
         C6Zj++eg7rDhRPRYyflBTcQKIcmSKUsBo5izwflSBLNcvhy0W+cibudi07cLFGpzKwhF
         9JdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DPecgQc9IrDFB6t3fU9sDhl6pEXoErsugQYzriIpc5g=;
        fh=CLBu1eM9YmacVoXCXvF98aZUnhP3PxZdO6H+Yozv+cY=;
        b=JCK8pV5UO4sA1HQnNPB5WPBIbA2C3MGVYdDwVQYlLAgwAAWxnxGTNeCpno9lNSZXa9
         30C34wlEM/QhsMIdJG1k5wKH8XfNQzjhtcC89NsqjEBccP8yiiSXTIJSe7h0+ugb96+k
         oRqUst1tc3etwsu8JFuHK4fCHOk37IKvIjInvyo1klHxn/N6VAoVPTd58vkUZjIQhG7y
         aDNBK25MxuXpNerxPU0bG7OLp0MTk7JxvL/RGyBSfOzqgZ5bE03G3SqZUGpoUI8i7uYM
         RQnI85KXWRzOrDfnH5sZKLau5vT/Cpg+rbdYKoilH+/G9M033brwYlGtsyqT6SaI9QT8
         9BWw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1794551412; x=1795156212; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DPecgQc9IrDFB6t3fU9sDhl6pEXoErsugQYzriIpc5g=;
        b=rQkC8vsHEaGE5J10DN4ZWryeDp3GUno4TX+ioWa1rjC9C7gctA4Mr/XQB0Aw4FthHs
         X/+LovDSxyz2dGUZQrQTYVrqFgucJHnW9+4hsLKGeF+BNiFxmPZmgUg7CyWVV4ZRz4yT
         MRnUjCfOvUs+xM7jJsJBCBmVE0qgsQNkWyCrrpxX7m/U9oTXAexnKFhQem6itu9FY7jz
         axuROBmp5R85n3Q6S93RT5OQNyRXGmR5mq1q+GHpUVxkokX/+VQKGjx+bKcDBw1zmG2D
         6zEnT8+TYgTEE3VzdCsunKvwhUou2I4RUTHNS966Fir9Oy7mlKFRtTfGBLDWIZiXwmyI
         z4BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794551412; x=1795156212;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DPecgQc9IrDFB6t3fU9sDhl6pEXoErsugQYzriIpc5g=;
        b=uO3AZXjiOj2j18rZ5tgAQ5ydW4mxiNIhzXCahJw4ge0YpGdicnKqH5izRXTpEWNkXA
         sC4Uy/IDKKuVwtSGp103PM69iTT5tLgph+DECJmyHOGtFVlqAIxFgqrPtkJ6ff7kOLNd
         pvqIHnRLQ2rGDX4AhXQOInmDFDV23qbDA+66AnRyJu6E5HeDeIyxp98R8Ok5CSr2FlfY
         /B/8dMLXM/C/n173fjo3LfbTLM3P+ItzNe/oYdI9xIgogRZf08Em3kmg/7avARNkZ13J
         UUbhMMa7+UNzvq1vyKqvZXNCY5d24hLgIe1MLVa1AlpI82XPHRoNCPnaekhYvMNJXosT
         qK+Q==
X-Forwarded-Encrypted: i=1; AL+hErGiyVBSsK2drbkGnfSYXdweVytkwI60aSIMGn1qU4i8PjfKmD8H38OK6pSeJqhzZx9ViDFI9Y0KrGlReg==@lists.infradead.org
X-Gm-Message-State: APuU4Z9HvK122ISiLLzB0l5iLIN/QQUymdslo5j3awUy+jcTRHzAybYF
	OTSa2ePKMSmcX+k/a2NLDWdpWz7IQUXKOhPtDPY7DnmxTPDO2usS6fSvf63mHuJH3TWgmEKOgl5
	LeVmruLKnmQAtRayPHeKNA+Ppd8hCxQPxS8p0e11Vqg==
X-Gm-Gg: AYBFou2kf/+sKrrHy6ZYzBwdmWwgQ/t7Jel1+E2HI48SUIpf2mc3IcBKfqWwyB3zN0W
	5z7/Yq1Cw+IMaZFqL5dOwta1Z4Z+3jFeP66ZqoLRm4/z7NxGyd/h0YHrd/ofZ/4JHQcGWN9/ezM
	p/xFYreVvqAF5gGH3/q1IohB8GNREqEKmycBsiYNPun9vvEHoqv+itoCLKqdUUAsnhCEIkjhFNt
	3ZjgTLAZ+NDUlhTVuFNkM5RGegGtvfS5SNoTdJaCRF58TLiYzJ1yAQJ9LkuIRg7e/vOdJ0NErFa
	BiY8f7JHDyvOe9giHCpxZOQArMcqN5F5S4Rl+AqnGzemLbsliEYskxArBEi2NmvjregnFXePrMi
	pcuqiSQ0EXDLBsTLvP2J7LEhS/0DQZcJU3Op5E6SlJft5R2tTCt/FpDu0qNdoCMsegYXd6pwpDW
	H4dBT2ryG3CXFv08RNPl76Ug6lrB+JXDSh31+UrZoVQSrwCrfWxY9fszbM
X-Received: by 2002:a05:651c:a182:b0:3ad:f0bb:344c with SMTP id
 38308e7fff4ca-3ae2b4cd92dmr4405361fa.10.1794551411872; Thu, 12 Nov 2026
 22:30:11 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261022025248.477832-1-jinyue.li@linux.alibaba.com>
In-Reply-To: <20261022025248.477832-1-jinyue.li@linux.alibaba.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 13 Nov 2026 11:59:59 +0530
X-Gm-Features: AclHuK8NiJX_tgbZANqAwiOjegb650NzlAml5enSgYn0fBkXeJUfWcHpMs2vGKY
Message-ID: <CAAhSdy13okqRhJLCygqZajrwDTa64gJt=SnCcZPRQxRd5E=WKQ@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: KVM: Fix double free of the split page cache
To: Li Jinyue <jinyue.li@linux.alibaba.com>
Cc: kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	atish.patra@linux.dev, pjw@kernel.org, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, alex@ghiti.fr, wang.yechao255@zte.com.cn, 
	stable@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_223014_035142_EADF3408 
X-CRM114-Status: GOOD (  20.41  )
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gVGh1LCBPY3QgMjIsIDIwMjYgYXQgODoyMuKAr0FNIExpIEppbnl1ZSA8amlueXVlLmxpQGxp
bnV4LmFsaWJhYmEuY29tPiB3cm90ZToKPgo+IGt2bV9yaXNjdl9tbXVfZnJlZV9wZ2QoKSBmcmVl
cyBwZ2Rfc3BsaXRfcGFnZV9jYWNoZSBhZnRlciBkcm9wcGluZwo+IG1tdV9sb2NrLiBJdCBpcyBy
ZWFjaGVkIGZyb20ga3ZtX2FyY2hfZmx1c2hfc2hhZG93X2FsbCgpLCBpLmUuIGZyb20gdGhlCj4g
TU1VIG5vdGlmaWVyIC0+cmVsZWFzZSgpIGNhbGxiYWNrLCB3aGljaCBjYW4gcnVuIGNvbmN1cnJl
bnRseSBmb3IgdGhlCj4gc2FtZSBWTSBmcm9tIGV4aXRfbW1hcCgpIGFuZCBmcm9tIG1tdV9ub3Rp
Zmllcl91bnJlZ2lzdGVyKCkgaW4KPiBrdm1fZGVzdHJveV92bSgpLiBUaGUgc3RhZ2UtMiB0ZWFy
ZG93biBpcyBzZXJpYWxpemVkIGJ5IG1tdV9sb2NrIGFuZCB0aGUKPiBzZWNvbmQgY2FsbGVyIGZp
bmRzIGt2bS0+YXJjaC5wZ2QgYWxyZWFkeSBjbGVhcmVkLCBidXQgYm90aCBjYWxsZXJzIHRoZW4K
PiBnbyBvbiB0byBmcmVlIHRoZSBjYWNoZSwgYW5kIGt2bV9tbXVfZnJlZV9tZW1vcnlfY2FjaGUo
KSBkb2VzIG5vdAo+IHRvbGVyYXRlIGNvbmN1cnJlbnQgY2FsbGVyczoKPgo+ICAgQlVHOiBLQVNB
TjogZG91YmxlLWZyZWUgaW4ga3ZmcmVlKzB4MjgvMHgzMgo+ICAgLi4uCj4gICAga2ZyZWUrMHhj
NC8weDQyOAo+ICAgIGt2ZnJlZSsweDI4LzB4MzIKPiAgICBrdm1fbW11X2ZyZWVfbWVtb3J5X2Nh
Y2hlKzB4MTc4LzB4MjQ2Cj4gICAga3ZtX3Jpc2N2X21tdV9mcmVlX3BnZCsweDIwZS8weDJiNAo+
ICAgIGt2bV9hcmNoX2ZsdXNoX3NoYWRvd19hbGwrMHgxYS8weDI0Cj4gICAga3ZtX21tdV9ub3Rp
Zmllcl9yZWxlYXNlKzB4MzYvMHg3Ywo+ICAgIF9fbW11X25vdGlmaWVyX3JlbGVhc2UrMHgxODIv
MHg2NmEKPiAgICBleGl0X21tYXArMHg3ZjgvMHg4YzQKPiAgICBtbXB1dCsweDdlLzB4MmZjCj4g
ICAgZG9fZXhpdCsweDU3YS8weDIyYjQKPiAgIC4uLgo+ICAgRnJlZWQgYnkgdGFzayAxNTk1NiBv
biBjcHUgMyBhdCA4OTI2LjEwMzUyNHM6Cj4gICAuLi4KPiAgICBrdm1fbW11X2ZyZWVfbWVtb3J5
X2NhY2hlKzB4MTc4LzB4MjQ2Cj4gICAga3ZtX3Jpc2N2X21tdV9mcmVlX3BnZCsweDIwZS8weDJi
NAo+ICAgIGt2bV9hcmNoX2ZsdXNoX3NoYWRvd19hbGwrMHgxYS8weDI0Cj4gICAga3ZtX21tdV9u
b3RpZmllcl9yZWxlYXNlKzB4MzYvMHg3Ywo+ICAgIG1tdV9ub3RpZmllcl91bnJlZ2lzdGVyKzB4
ZjAvMHgzMjgKPiAgICBrdm1fcHV0X2t2bSsweDMyYS8weDdiOAo+ICAgIGt2bV92bV9yZWxlYXNl
KzB4M2EvMHg1MAo+ICAgIF9fZnB1dCsweDMzMC8weDk3NAo+Cj4gVGhlIGNhY2hlIG9ubHkgZmVl
ZHMgaHVnZSBwYWdlIHNwbGl0dGluZyBmcm9tIFZNIGlvY3Rscywgc28gaXQgZG9lcyBub3QKPiBu
ZWVkIHRvIGJlIHJlbGVhc2VkIHRvZ2V0aGVyIHdpdGggdGhlIHBhZ2UgdGFibGUuIEZyZWUgaXQg
ZnJvbQo+IGt2bV9hcmNoX2Rlc3Ryb3lfdm0oKSBpbnN0ZWFkLCB3aGljaCBydW5zIG9uY2UgYWZ0
ZXIgdGhlIE1NVSBub3RpZmllcgo+IGhhcyBiZWVuIHVucmVnaXN0ZXJlZCwgYXMgYXJtNjQgYW5k
IHg4NiBhbHJlYWR5IGRvLiBUaGUgZXJyb3IgcGF0aCBpbgo+IGt2bV9hcmNoX2luaXRfdm0oKSBp
cyBub3QgYWZmZWN0ZWQgYmVjYXVzZSB0aGUgY2FjaGUgY2Fubm90IGhhdmUgYmVlbgo+IGZpbGxl
ZCBhdCB0aGF0IHBvaW50Lgo+Cj4gRm91bmQgYnkgc3l6a2FsbGVyLgo+Cj4gRml4ZXM6IDZjN2Y3
NWVmMDk2YSAoIlJJU0MtVjogS1ZNOiBBZGQgdGhlIHNwbGl0IHBhZ2UgY2FjaGUgZm9yIGlvY3Rs
IGNvbnRleHQiKQo+IENjOiBzdGFibGVAdmdlci5rZXJuZWwub3JnCj4gU2lnbmVkLW9mZi1ieTog
TGkgSmlueXVlIDxqaW55dWUubGlAbGludXguYWxpYmFiYS5jb20+CgpMR1RNLgoKUmV2aWV3ZWQt
Ynk6IEFudXAgUGF0ZWwgPGFudXBAYnJhaW5mYXVsdC5vcmc+CgpRdWV1ZWQgdGhpcyBhcyBmaXgg
Zm9yIExpbnV4LTcuNC1yY1gKClRoYW5rcywKQW51cAoKPiAtLS0KPiAgYXJjaC9yaXNjdi9rdm0v
bW11LmMgfCAyIC0tCj4gIGFyY2gvcmlzY3Yva3ZtL3ZtLmMgIHwgMiArKwo+ICAyIGZpbGVzIGNo
YW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9h
cmNoL3Jpc2N2L2t2bS9tbXUuYyBiL2FyY2gvcmlzY3Yva3ZtL21tdS5jCj4gaW5kZXggM2U5NTVk
ODA4NzQzLi43NGRlY2UyMmQxNzIgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9rdm0vbW11LmMK
PiArKysgYi9hcmNoL3Jpc2N2L2t2bS9tbXUuYwo+IEBAIC03OTgsOCArNzk4LDYgQEAgdm9pZCBr
dm1fcmlzY3ZfbW11X2ZyZWVfcGdkKHN0cnVjdCBrdm0gKmt2bSkKPgo+ICAgICAgICAgaWYgKHBn
ZCkKPiAgICAgICAgICAgICAgICAgZnJlZV9wYWdlcygodW5zaWduZWQgbG9uZylwZ2QsIGdldF9v
cmRlcihrdm1fcmlzY3ZfZ3N0YWdlX3BnZF9zaXplKSk7Cj4gLQo+IC0gICAgICAga3ZtX21tdV9m
cmVlX21lbW9yeV9jYWNoZSgma3ZtLT5hcmNoLnBnZF9zcGxpdF9wYWdlX2NhY2hlKTsKPiAgfQo+
Cj4gIHZvaWQga3ZtX3Jpc2N2X21tdV91cGRhdGVfaGdhdHAoc3RydWN0IGt2bV92Y3B1ICp2Y3B1
KQo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2t2bS92bS5jIGIvYXJjaC9yaXNjdi9rdm0vdm0u
Ywo+IGluZGV4IGE5ZjA4M2ZlZWI3Ni4uYTdlMWI1MTgyNTdhIDEwMDY0NAo+IC0tLSBhL2FyY2gv
cmlzY3Yva3ZtL3ZtLmMKPiArKysgYi9hcmNoL3Jpc2N2L2t2bS92bS5jCj4gQEAgLTU0LDYgKzU0
LDggQEAgdm9pZCBrdm1fYXJjaF9kZXN0cm95X3ZtKHN0cnVjdCBrdm0gKmt2bSkKPiAgICAgICAg
IGt2bV9kZXN0cm95X3ZjcHVzKGt2bSk7Cj4KPiAgICAgICAgIGt2bV9yaXNjdl9haWFfZGVzdHJv
eV92bShrdm0pOwo+ICsKPiArICAgICAgIGt2bV9tbXVfZnJlZV9tZW1vcnlfY2FjaGUoJmt2bS0+
YXJjaC5wZ2Rfc3BsaXRfcGFnZV9jYWNoZSk7Cj4gIH0KPgo+ICBpbnQga3ZtX3ZtX2lvY3RsX2ly
cV9saW5lKHN0cnVjdCBrdm0gKmt2bSwgc3RydWN0IGt2bV9pcnFfbGV2ZWwgKmlycWwsCj4KPiBi
YXNlLWNvbW1pdDogYzAzYzFhMTQ1MDdkZmFmOGI4NTZjMjYwOGY5YWMyMTYwMjFmYzIyMgo+IC0t
Cj4gMi4yNS4xCj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlz
Y3YK
