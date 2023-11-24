Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07B35C61DF4
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Nov 2023 07:22:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ZzHQGule67OmzxR16o7PvKNKU7mWXIfUDE/5q2t//IU=; b=d0Hc0d2dE2JfBr
	gVUBFzgH7MBXqpI32tfcC5DdQCnWP3iCPoN5yDeHnSDYZPfoggPusrAwGWEAYquqeq7/H+7TfB4K0
	KC73Lg13rjFp768a5+wP+11y7aVxS90a0NsR79qFR+Bx0PkW2dbI71xzZBEo6sZkfAKO0sV+apzw3
	dXK0iquoemYsuB30/whXi979pshZjZHTBrLbmWojTwJnXj/l9F40bc4R+pLAeUsLdfQroAl3eqdfe
	iTfgivjnUO33HvZxKe0EX1s2hARq9WfxqPzCxWSGGmKV8vCqbgB2puzj+lNExQfdLI3k9yXuCSm0D
	ee2AhJGVGepy1BdKTbHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r6QWH-006NYl-0f;
	Fri, 24 Nov 2023 07:22:33 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r6QWD-006NUt-1L
	for linux-riscv@lists.infradead.org;
	Fri, 24 Nov 2023 07:22:31 +0000
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-50aa8c0af41so2734701e87.1
        for <linux-riscv@lists.infradead.org>; Thu, 23 Nov 2023 23:22:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vrull.eu; s=google; t=1700810545; x=1701415345; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=A+QJwQ2ibzfm4ZH4G7RxTWHsFFrHVq+i8PDqnY0Hrac=;
        b=mh6Q+YxVW3uVRpszAJzOhW5eot0dJRT8h182UWg5S8VdVAHDgChw9xajeQ4clg8vBi
         h8/qOAHmcT/YmzDUWMHcE+a2ZqXa91ABofqmSKPeyMBRkOd+61nJ/jsB/0D+AFEPna9x
         v2h6tDRIXUV3XD06NYcUf+csgqNa2xEmpDSTyn0KVimR5tAEyipIxT5iUUtGY13WKYZx
         KoCllTsLtjB3hv5b+bql9CxPcxaTAdbBynqIOULmsLFfTkitZy7IUoYilGVC6GQfx2dR
         UjlVdKwqLeL8W7LRGubeb93JuFZQGI+Oz5ZvFL0gbbXeWlMibzeZ6KCjYXEggjfBpAz3
         YWeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700810545; x=1701415345;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A+QJwQ2ibzfm4ZH4G7RxTWHsFFrHVq+i8PDqnY0Hrac=;
        b=Tf9PtTqIYSpBzlMqH44jlSrc+GLYHR+Cg11CA0yb/ce5dC47AWMKj0cka+tqGMhFfY
         ko0OxKOvctOXM8gqgvJrIGn5M6ImMFpL1SAsJMRPYKXi2z77erOYXQ1psX+lVtSQd4/3
         nZ962/Vm7XrxD2NoC80YKQF8z067HnR9P7Yenh+rblak5CxMFEfdxyaGejB0xf4jd3tt
         SNpODDi4O7j47OySQNqvcS6i/K3vYh0n/VixdFVPLqrMOkddtas0NHjAr0uwknM7fXEb
         K6Do7zBntKOOPh3a0KnTQmrWN0qvJfWAecDKBsLpVctYT2SRZ6QQw6cDEsWvKinvbuzo
         yJ6Q==
X-Gm-Message-State: AOJu0YzTlehuvomVRFh373sHzSZWyJufh0jFTKdTUYs6qiO8fbDJzlQ5
	Hg2DN+nTESmcIcbmwQ7JTirX4UaTVN8WlotBqMtRijGm
X-Google-Smtp-Source: AGHT+IG4KyTl5CwzMZ1gy4FucyPBBLxaEgYRfo01XZveBgxlerDUkvXhDFprA+AP7dQahAlFaE4+/g==
X-Received: by 2002:a17:906:2259:b0:9ee:a767:12e7 with SMTP id 25-20020a170906225900b009eea76712e7mr1762679ejr.6.1700810524590;
        Thu, 23 Nov 2023 23:22:04 -0800 (PST)
Received: from beast.fritz.box (62-178-148-172.cable.dynamic.surfer.at. [62.178.148.172])
        by smtp.gmail.com with ESMTPSA id q18-20020a1709060e5200b00992f2befcbcsm1709930eji.180.2023.11.23.23.22.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Nov 2023 23:22:04 -0800 (PST)
From: Christoph Muellner <christoph.muellner@vrull.eu>
To: linux-riscv@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Andrew Morton <akpm@linux-foundation.org>,
	Shuah Khan <shuah@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Anup Patel <apatel@ventanamicro.com>,
	Philipp Tomsich <philipp.tomsich@vrull.eu>,
	Andrew Jones <ajones@ventanamicro.com>,
	Guo Ren <guoren@kernel.org>,
	Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>,
	Alan Stern <stern@rowland.harvard.edu>,
	Andrea Parri <parri.andrea@gmail.com>,
	Will Deacon <will@kernel.org>,
	Daniel Lustig <dlustig@nvidia.com>,
	Peter Zijlstra <peterz@infradead.org>
Cc: =?UTF-8?q?Christoph=20M=C3=BCllner?= <christoph.muellner@vrull.eu>
Subject: [RFC PATCH 0/5] RISC-V: Add dynamic TSO support
Date: Fri, 24 Nov 2023 08:21:37 +0100
Message-ID: <20231124072142.2786653-1-christoph.muellner@vrull.eu>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231123_232229_458252_C0D33694 
X-CRM114-Status: GOOD (  16.86  )
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

RnJvbTogQ2hyaXN0b3BoIE3DvGxsbmVyIDxjaHJpc3RvcGgubXVlbGxuZXJAdnJ1bGwuZXU+CgpU
aGUgdXBjb21pbmcgUklTQy1WIFNzZHRzbyBzcGVjaWZpY2F0aW9uIGludHJvZHVjZXMgYSBiaXQg
aW4gdGhlIHNlbnZjZmcKQ1NSIHRvIHN3aXRjaCB0aGUgbWVtb3J5IGNvbnNpc3RlbmN5IG1vZGVs
IGF0IHJ1bi10aW1lIGZyb20gUlZXTU8gdG8gVFNPCihhbmQgYmFjaykuIFRoZSBhY3RpdmUgY29u
c2lzdGVuY3kgbW9kZWwgY2FuIHRoZXJlZm9yZSBiZSBzd2l0Y2hlZCBvbiBhCnBlci1oYXJ0IGJh
c2UgYW5kIG1hbmFnZWQgYnkgdGhlIGtlcm5lbCBvbiBhIHBlci1wcm9jZXNzL3RocmVhZCBiYXNl
LgoKVGhpcyBwYXRjaCBpbXBsZW1lbnRzIGJhc2ljIFNzZHRzbyBzdXBwb3J0IGFuZCBhZGRzIGEg
cHJjdGwgQVBJIG9uIHRvcApzbyB0aGF0IHVzZXItc3BhY2UgcHJvY2Vzc2VzIGNhbiBzd2l0Y2gg
dG8gYSBzdHJvbmdlciBtZW1vcnkgY29uc2lzdGVuY3kKbW9kZWwgKHRoYW4gdGhlIGtlcm5lbCB3
YXMgd3JpdHRlbiBmb3IpIGF0IHJ1bi10aW1lLgoKSSBhbSBub3Qgc3VyZSBpZiBvdGhlciBhcmNo
aXRlY3R1cmVzIHN1cHBvcnQgc3dpdGNoaW5nIHRoZSBtZW1vcnkKY29uc2lzdGVuY3kgbW9kZWwg
YXQgcnVuLXRpbWUsIGJ1dCBkZXNpZ25pbmcgdGhlIHByY3RsIEFQSSBpbiBhbgphcmNoLWluZGVw
ZW5kZW50IHdheSBhbGxvd3MgcmV1c2luZyBpdCBpbiB0aGUgZnV0dXJlLgoKVGhlIHBhdGNoc2V0
IGFsc28gY29tZXMgd2l0aCBhIHNob3J0IGRvY3VtZW50YXRpb24gb2YgdGhlIHByY3RsIEFQSS4K
ClRoaXMgc2VyaWVzIGlzIGJhc2VkIG9uIHRoZSBzZWNvbmQgZHJhZnQgb2YgdGhlIFNzZHRzbyBz
cGVjaWZpY2F0aW9uCndoaWNoIHdhcyBwdWJsaXNoZWQgcmVjZW50bHkgb24gYW4gUlZJIGxpc3Q6
CiAgaHR0cHM6Ly9saXN0cy5yaXNjdi5vcmcvZy90ZWNoLWFyY2gtcmV2aWV3L21lc3NhZ2UvMTgz
Ck5vdGUsIHRoYXQgdGhlIFNzZHRzbyBzcGVjaWZpY2F0aW9uIGlzIGluIGRldmVsb3BtZW50IHN0
YXRlCihpLmUuLCBub3QgZnJvemVuIG9yIGV2ZW4gcmF0aWZpZWQpIHdoaWNoIGlzIGFsc28gdGhl
IHJlYXNvbgp3aHkgSSBtYXJrZWQgdGhlIHNlcmllcyBhcyBSRkMuCgpPbmUgYXNwZWN0IHRoYXQg
aXMgbm90IGNvdmVyZWQgaW4gdGhpcyBwYXRjaHNldCBpcyB2aXJ0dWFsaXphdGlvbi4KSXQgaXMg
cGxhbm5lZCB0byBhZGQgdmlydHVhbGl6YXRpb24gc3VwcG9ydCBpbiBhIGxhdGVyIHZlcnNpb24u
CkhpbnRzL3N1Z2dlc3Rpb25zIG9uIGhvdyB0byBpbXBsZW1lbnQgdGhpcyBwYXJ0IGFyZSB2ZXJ5
IG11Y2gKYXBwcmVjaWF0ZWQuCgpDaHJpc3RvcGggTcO8bGxuZXIgKDUpOgogIFJJU0MtVjogQWRk
IGJhc2ljIFNzZHRzbyBzdXBwb3J0CiAgUklTQy1WOiBFeHBvc2UgU3NkdHNvIHZpYSBod3Byb2Jl
IEFQSQogIHVhcGk6IHByY3RsOiBBZGQgbmV3IHByY3RsIGNhbGwgdG8gc2V0L2dldCB0aGUgbWVt
b3J5IGNvbnNpc3RlbmN5CiAgICBtb2RlbAogIFJJU0MtVjogSW1wbGVtZW50IHByY3RsIGNhbGwg
dG8gc2V0L2dldCB0aGUgbWVtb3J5IGNvbnNpc3RlbmN5IG1vZGVsCiAgUklTQy1WOiBzZWxmdGVz
dHM6IEFkZCBEVFNPIHRlc3RzCgogRG9jdW1lbnRhdGlvbi9hcmNoL3Jpc2N2L2h3cHJvYmUucnN0
ICAgICAgICAgIHwgIDMgKwogLi4uL21tL2R5bmFtaWMtbWVtb3J5LWNvbnNpc3RlbmN5LW1vZGVs
LnJzdCAgIHwgNzYgKysrKysrKysrKysrKysrKysrCiBhcmNoL3Jpc2N2L0tjb25maWcgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgfCAxMCArKysKIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vY3Ny
LmggICAgICAgICAgICAgICAgICB8ICAxICsKIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vZHRzby5o
ICAgICAgICAgICAgICAgICB8IDc0ICsrKysrKysrKysrKysrKysrKwogYXJjaC9yaXNjdi9pbmNs
dWRlL2FzbS9od2NhcC5oICAgICAgICAgICAgICAgIHwgIDEgKwogYXJjaC9yaXNjdi9pbmNsdWRl
L2FzbS9wcm9jZXNzb3IuaCAgICAgICAgICAgIHwgIDggKysKIGFyY2gvcmlzY3YvaW5jbHVkZS9h
c20vc3dpdGNoX3RvLmggICAgICAgICAgICB8ICAzICsKIGFyY2gvcmlzY3YvaW5jbHVkZS91YXBp
L2FzbS9od3Byb2JlLmggICAgICAgICB8ICAxICsKIGFyY2gvcmlzY3Yva2VybmVsL01ha2VmaWxl
ICAgICAgICAgICAgICAgICAgICB8ICAxICsKIGFyY2gvcmlzY3Yva2VybmVsL2NwdWZlYXR1cmUu
YyAgICAgICAgICAgICAgICB8ICAxICsKIGFyY2gvcmlzY3Yva2VybmVsL2R0c28uYyAgICAgICAg
ICAgICAgICAgICAgICB8IDMzICsrKysrKysrCiBhcmNoL3Jpc2N2L2tlcm5lbC9wcm9jZXNzLmMg
ICAgICAgICAgICAgICAgICAgfCAgNCArCiBhcmNoL3Jpc2N2L2tlcm5lbC9zeXNfcmlzY3YuYyAg
ICAgICAgICAgICAgICAgfCAgMSArCiBpbmNsdWRlL3VhcGkvbGludXgvcHJjdGwuaCAgICAgICAg
ICAgICAgICAgICAgfCAgNSArKwoga2VybmVsL3N5cy5jICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIHwgMTIgKysrCiB0b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9yaXNjdi9NYWtlZmls
ZSAgICAgICAgfCAgMiArLQogdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvcmlzY3YvZHRzby8uZ2l0
aWdub3JlIHwgIDEgKwogdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvcmlzY3YvZHRzby9NYWtlZmls
ZSAgIHwgMTEgKysrCiB0b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9yaXNjdi9kdHNvL2R0c28uYyAg
ICAgfCA3NyArKysrKysrKysrKysrKysrKysrCiAyMCBmaWxlcyBjaGFuZ2VkLCAzMjQgaW5zZXJ0
aW9ucygrKSwgMSBkZWxldGlvbigtKQogY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24v
bW0vZHluYW1pYy1tZW1vcnktY29uc2lzdGVuY3ktbW9kZWwucnN0CiBjcmVhdGUgbW9kZSAxMDA2
NDQgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9kdHNvLmgKIGNyZWF0ZSBtb2RlIDEwMDY0NCBhcmNo
L3Jpc2N2L2tlcm5lbC9kdHNvLmMKIGNyZWF0ZSBtb2RlIDEwMDY0NCB0b29scy90ZXN0aW5nL3Nl
bGZ0ZXN0cy9yaXNjdi9kdHNvLy5naXRpZ25vcmUKIGNyZWF0ZSBtb2RlIDEwMDY0NCB0b29scy90
ZXN0aW5nL3NlbGZ0ZXN0cy9yaXNjdi9kdHNvL01ha2VmaWxlCiBjcmVhdGUgbW9kZSAxMDA2NDQg
dG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvcmlzY3YvZHRzby9kdHNvLmMKCi0tIAoyLjQxLjAKCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNj
diBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
