Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6F25EF06E2
	for <linux-riscv@archiver.kernel.org>; Sun,  8 Feb 2026 06:39:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=SuA2KLRJwLcOMkBEhLJ+QZ5yS27QXHAdfIc/oJHaGB0=; b=4PbESfyzojwg0x
	y5OFfx9DUYRqnkeRwPYd6jyeXhd/fKLM6hjwC0bAZcBK/WJ5I9ScOopwVmqkfeSFq1RhqlrPQpTxg
	/+3EaFq3gy5ywa5D9CyfIxOZSudGLAy/e7zFJuEF/TqoTUZW5AIbrn29I6WIZ82p3HvQMq3KluPvy
	4g+lY4QR3FZHkBT0GF6P3cJwpUIEHubQGd0KsV5ZHUeYxd5bkyroXGMKps3pVj9HkgtqQ/PJD2MRG
	UFe20e8grzlo4lNMfWqd0eMORSVN/TmcxJWopVXwjYtj6hRW90uzYP1P/fh1x+Xg7QuowC5QvN16+
	vNRn+dQTjWgAHGCmrtrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voyRg-0000000D5Zn-3lRq;
	Sun, 08 Feb 2026 06:39:02 +0000
Received: from mail-dl1-x122a.google.com ([2607:f8b0:4864:20::122a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voyRe-0000000D5ZJ-1tkc
	for linux-riscv@lists.infradead.org;
	Sun, 08 Feb 2026 06:38:59 +0000
Received: by mail-dl1-x122a.google.com with SMTP id a92af1059eb24-1233b953bebso8313817c88.1
        for <linux-riscv@lists.infradead.org>; Sat, 07 Feb 2026 22:38:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1770532737; x=1771137537; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cj7VDyEmyttJ6U7k+eNuSHRKVocJsp9GVC83IsF+hRI=;
        b=CMcoSUQLFbXAzfpoPs9Ch8B0xfsJnuRW6Qf7R9+uZ+JAKwgS22wzG2y4oe+szd4rHW
         Uu4g+cOsiCqnxLaIEUeOfBZvQWi+7k423AR3TGLWQF7BfA+68qQ8FVHsBhTSRMBCdArC
         nPJyEqNW0og0w/2X5+HdhKk7lucbX4rqfg8rRwQgP3yt9ZV3Ppwg6ZVtuHQrf6i1s81C
         XE6wvNzl2VwhQQKX4qHLZLu6jfRDAnW8gnUZV/wsqKGDWE1zhqXtpwyoK/pSJpKZbo5f
         rjKC3zldsOREiSsE0jkjYlXSLvktITrnj7lIu0OmiyLS/xyi+YwUWGw+r5Ct/c3mscEZ
         7NNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770532737; x=1771137537;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cj7VDyEmyttJ6U7k+eNuSHRKVocJsp9GVC83IsF+hRI=;
        b=cIaHFOpAsAZlWH4T4qXspZpL28zXt8W1w0RgKG9wPoIlz9tpnZEYxwl8SAm/0LKiMz
         KpJ40012I791eDBobJ97KKSWavJqTqgOvmi9xQG8fwE7t+Lx5D7ZibY7cxDre6b9VWpA
         ts5R361hpPa8YLiYFNdUlnXR83W4weYCswcIkzX1++VpWneaWi4ATiwLdga2DvRTJezJ
         BlFeAYnzHTIk2U5ierzpMiSi7/uc0c0c24hjYi/BRkdKKxdQI0xzFLWu+j7+D6EOXDax
         YjqI8NpJdlDjfZ1xgaW6QzIojmy9igCBjgl+o8XEo0bobnZ4J16XbNxtiboMS9TPooZu
         unGw==
X-Forwarded-Encrypted: i=1; AJvYcCVx0qJTLYFtBIy/xC89+VuYHYlyoDYk9klCAZ7IeCG700HKBpjsaGga+OUC4/vLYULMSq63uWJcKUENuA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx77m33xqi7N7ht/GkoIzHcRt/Rze/HKNYNRYZc41rhYLrgrbWS
	W1OFgnw8I92mGabRDfyNjRP3HyCu+RFERDTQLShaxp9vqR/P37XCrUTMFgXsajHnj4g=
X-Gm-Gg: AZuq6aL0QT7UeHN7qHhoesmhAODPfM4Y7x8O71T2wU8TEsXBhp1D5hNby0rLxIjsZXU
	EfaJvVPc6u28EbBzOKhtWtSLoQEIAZq0vsusFTya2w9WNPzLnby5snJnqSdaCuTnZuPTgp/dB1s
	v4b/xn3JAX0gfdSt7L9pLs9vao2DbFkGeJ/LqqHQQfelEFYevb4BfOFE7yTpup33OVUbFAAgpB+
	hpsf7KC3RkNnQJSron4hy2QNB0h4U3nr0Y2uOXSEjd3hBOagn4PxF1cNKNwIo3Rz5Bvy5wg6QUM
	J0vQU5EYLZ/YyGbUXwM0fT6pNeVagKBr7ez5cT5aKarfoT1kgf+76b58Z9YRVZOJzClQ29J9mTP
	/zdB2Ox5zPHSYThyIGeid5+NsMR8jh0H4MMQEjbyyaQLjveIHfmBqA8upoNzkOujBPB1W2/Sbya
	ISXZJKa/pFzWs8udOB85uVrM0=
X-Received: by 2002:a05:7022:6894:b0:122:153:d161 with SMTP id a92af1059eb24-12704001972mr4399912c88.17.1770532736689;
        Sat, 07 Feb 2026 22:38:56 -0800 (PST)
Received: from sw04.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1270c9ff2bcsm5114647c88.1.2026.02.07.22.38.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Feb 2026 22:38:54 -0800 (PST)
From: Zong Li <zong.li@sifive.com>
To: tjeznach@rivosinc.com,
	joro@8bytes.org,
	will@kernel.org,
	robin.murphy@arm.com,
	robh@kernel.org,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	mark.rutland@arm.com,
	conor+dt@kernel.org,
	krzk@kernel.org,
	guoyaxing@bosc.ac.cn,
	luxu.kernel@bytedance.com,
	lv.zheng@linux.spacemit.com,
	andrew.jones@oss.qualcomm.com,
	linux-kernel@vger.kernel.org,
	iommu@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-perf-users@vger.kernel.org
Cc: Zong Li <zong.li@sifive.com>
Subject: [PATCH v2 0/2] RISC-V IOMMU HPM support
Date: Sat,  7 Feb 2026 22:38:34 -0800
Message-ID: <20260208063848.3547817-1-zong.li@sifive.com>
X-Mailer: git-send-email @GIT_VERSION@
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260207_223858_554823_05F8341A 
X-CRM114-Status: GOOD (  19.57  )
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

VGhpcyBzZXJpZXMgaW1wbGVtZW50cyBzdXBwb3J0IGZvciB0aGUgUklTQy1WIElPTU1VIGhhcmR3
YXJlIHBlcmZvcm1hbmNlCm1vbml0b3IuCgpUaGUgUklTQy1WIElPTU1VIFBNVSBkcml2ZXIgaXMg
aW1wbGVtZW50ZWQgYXMgYW4gYXV4aWxpYXJ5IGRldmljZSBkcml2ZXIKY3JlYXRlZCBieSB0aGUg
cGFyZW50IFJJU0MtViBJT01NVSBkcml2ZXIuIFRoZSBjaGlsZCBkcml2ZXIgY2FuIG9idGFpbgpy
ZXNvdXJjZXMgYW5kIGluZm9ybWF0aW9uIGZyb20gdGhlIHBhcmVudCBkZXZpY2UsIHN1Y2ggYXMg
dGhlIE1NSU8gYmFzZQphZGRyZXNzIGFuZCBJUlEgbnVtYmVyLgoKQ3VzdG9tIGV2ZW50IHN1cHBv
cnQgaXMgbm90IGluY2x1ZGVkIGluIHRoaXMgc2VyaWVzIGFuZCB3aWxsIGJlIHN1Ym1pdHRlZAph
cyBhIHNlcGFyYXRlIHNlcmllcy4gVGhlIGlkZWEgaXMgdGhhdCBjdXN0b20gZXZlbnRzIHdpbGwg
YmUgZGVmaW5lZAp0aHJvdWdoIHRoZSBkcml2ZXIgZGF0YSBvZiB0aGUgYXV4aWxpYXJ5IGRyaXZl
ci4gV2hlbiB0aGUgcGFyZW50IElPTU1VCmRyaXZlciBjcmVhdGVzIHRoZSBhdXhpbGlhcnkgZGV2
aWNlLCBpdCBzaG91bGQgcGFzcyBhIHZlbmRvci1zcGVjaWZpYwpuYW1lIGFzIHRoZSBkZXZpY2Ug
bmFtZSBpbiBvcmRlciB0byBtYXRjaCB0aGUgY29ycmVzcG9uZGluZyBhdXhpbGlhcnkKZGV2aWNl
IElELgoKQWZ0ZXIgbXkgaW5pdGlhbCBSRkMgYW5kIHRoZSB2MSBwYXRjaCBzZXJpZXMgd2VyZSBw
b3N0ZWQsIHNpbWlsYXIgcGF0Y2gKc2VyaWVzIGFsc28gYXBwZWFyZWQgb24gdGhlIG1haWxpbmcg
bGlzdC4KCk9uZSB3YXMgZnJvbSBZYXhpbmcgR3VvOgpodHRwczovL2xvcmUua2VybmVsLm9yZy9h
bGwvMjAyNTA5MTUwMjA5MTEuMTMxMy0xLWd1b3lheGluZ0Bib3NjLmFjLmNuLwoKYW5kIGFub3Ro
ZXIgZnJvbSBMdiBaaGVuZzoKaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzMwQzdBRDM1MURC
NTUyNzYrYThiMDNkYWMtYzVhZi00MDM0LTg2MzEtYWMxYzM1MmE0NjlmQGxpbnV4LnNwYWNlbWl0
LmNvbS8KCllheGluZyBoYXMgYWdyZWVkIHRvIHBhdXNlIGhpcyBzZXJpZXMsIGFzIGRpc2N1c3Nl
ZCBoZXJlOgpodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1pb21tdS8yY2U5ZDhiZS0xMGIz
LTQ4ZGQtYjk5ZS03MzU4MzQ3ZmMxNzFAYm9zYy5hYy5jbi8KClRoZSBtb3RpdmF0aW9uIGZvciBz
ZW5kaW5nIHRoaXMgdjIgdmVyc2lvbiBpcyBub3Qgb25seSB0byBhZGRyZXNzIHRoZQpmZWVkYmFj
ayBhbmQgc3VnZ2VzdGlvbnMgZnJvbSB0aGUgcHJldmlvdXMgcm91bmQsIGJ1dCBhbHNvIHRvIGlu
dHJvZHVjZQphIG1ham9yIHN0cnVjdHVyYWwgY2hhbmdlOiB0aGUgUE1VIGRyaXZlciBoYXMgYmVl
biBtb3ZlZCB1bmRlcgpkcml2ZXJzL3BlcmYvLCB3aGljaCBoYXMgYmVlbiBtZW50aW9uZWQgcmVw
ZWF0ZWRseSBieSBzZXZlcmFsIHBlb3BsZS4KVGhpcyByZXN1bHRzIGluIGEgZGlmZmVyZW50IGRy
aXZlciBzdHJ1Y3R1cmUgY29tcGFyZWQgdG8gbXkgZWFybGllcgp2ZXJzaW9uIGFuZCB0aGUgb3Ro
ZXIgdHdvIHNlcmllcywgYW5kIEknZCBsaWtlIHRvIGdhdGhlciBmZWVkYmFjayBhbmQKc3VnZ2Vz
dGlvbnMgZnJvbSB0aGUgY29tbXVuaXR5IG9uIHRoaXMgYXBwcm9hY2guIElmIHRoZSBjb21tdW5p
dHkgd291bGQKcHJlZmVyIHRvIGdvIHdpdGggTHYgWmhlbmfigJlzIHZlcnNpb24gaW5zdGVhZCwg
SSBhbSBwZXJmZWN0bHkgZmluZSB3aXRoCnRoYXQgYXMgd2VsbC4KClNpbmNlIEkgZGlkIG5vdCBm
b2xsb3cgdXAgY2xvc2VseSBvbiB0aGUgcGF0Y2hlcyBmcm9tIEx2IFpoZW5nLCBKaW5neXUKTGks
IG9yIFlheGluZywgaXQgaXMgcG9zc2libGUgdGhhdCB0aGlzIHYyIHNlcmllcyBtYXkgbWlzcyBz
b21lIGltcG9ydGFudApmZWF0dXJlcyBvciBmaXhlcyBmcm9tIHRoZWlyIHdvcmsuIFRoZXJlZm9y
ZSwgSSB3b3VsZCByZWFsbHkgYXBwcmVjaWF0ZQppdCBpZiBldmVyeW9uZSBjb3VsZCBoZWxwIHJl
dmlldyB0aGlzIHYyIHNlcmllcyBhbmQgcG9pbnQgb3V0IGFueQphZGRpdGlvbmFsIGZpeGVzIG9y
IGZlYXR1cmUgc3VwcG9ydCB0aGF0IEkgbWF5IGhhdmUgbWlzc2VkLgoKQ2hhbmdlZCBpbiB2MToK
LSBSZWJhc2VkIG9udG8gdjYuMTktcmM4Ci0gUGljayBhbGwgc3VnZ2VzdGlvbnMgYW5kIGZlZWRi
YWNrcyBmcm9tIHYxIHNlcmllcwotIEFkZCBjcHUgaG90cGx1ZyBpbXBsZW1lbnRhdGlvbiB0byBh
dm9pZCByYWNlIGVuYWJsZW1lbnQKLSBNb3ZlIFBNVS1yZWxhdGVkIGRlZmluaXRpb24gZnJvbSBo
ZWFkZXIgdG8gYyBmaWxlCi0gQ2hhbmdlIFBNVSBkcml2ZXIgdG8gYXV4aWxpYXJ5IGRldmljZSBk
cml2ZXIKCkNoYW5nZWQgaW4gUkZDOgotIFJlYmFzZSBvbnRvIHY2LjEzLXJjNwotIENsZWFyIGlu
dGVycnVwdCBwZW5kaW5nIGJlZm9yZSBoYW5kbGluZyBpbnRlcnJ1cHQKLSBGaXggdGhlIGNvdW50
ZXIgdmFsdWUgaXNzdWUgY2F1c2VkIGJ5IE9GIGJpdCBpbiB0aGUgY3ljbGUgY291bnRlci4KLSBJ
bnZva2UgcmlzY3ZfaW9tbXVfaHBtX2Rpc2FibGUoKSBpbnN0ZWFkIG9mIHJpc2N2X2lvbW11X3Bt
dV91bmluaXQoKQogIGluIHJpc2N2X2lvbW11X3JlbW92ZSgpCgpab25nIExpICgyKToKICBkcml2
ZXJzL3BlcmY6IHJpc2N2LWlvbW11OiBhZGQgcmlzYy12IGlvbW11IHBtdSBkcml2ZXIKICBpb21t
dS9yaXNjdjogY3JlYXRlIGEgYXV4aWxpYXJ5IGRldmljZSBmb3IgSFBNCgogZHJpdmVycy9pb21t
dS9yaXNjdi9pb21tdS1iaXRzLmggfCAgNjEgLS0tCiBkcml2ZXJzL2lvbW11L3Jpc2N2L2lvbW11
LmMgICAgICB8ICAyMCArCiBkcml2ZXJzL3BlcmYvS2NvbmZpZyAgICAgICAgICAgICB8ICAxMiAr
CiBkcml2ZXJzL3BlcmYvTWFrZWZpbGUgICAgICAgICAgICB8ICAgMSArCiBkcml2ZXJzL3BlcmYv
cmlzY3ZfaW9tbXVfcG11LmMgICB8IDY2MSArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
CiA1IGZpbGVzIGNoYW5nZWQsIDY5NCBpbnNlcnRpb25zKCspLCA2MSBkZWxldGlvbnMoLSkKIGNy
ZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL3BlcmYvcmlzY3ZfaW9tbXVfcG11LmMKCi0tIAoyLjQz
LjcKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51
eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
