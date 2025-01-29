Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E139EC02193
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Jan 2025 09:17:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GqOOvM1Tai+YO/WB3GvpzX9xCIza2wuDIHd2fOfvenM=; b=Q0QO+wuFb6ZYe/
	lNSMyYkHWnNH3SPQJrcxBhiNR7BH8zhx5cHqxh+uInzp+YhH8QJsBy/7Hbdzh/HD99Y9+w0Fds96z
	qlspcs/KH19zIoFribJkBNa38kzqWpMxoNPJYUTgfpkzQNakplYu1nKOymx3D9XsiIDfDeLAkoklf
	4Jfs2R2lS5BJ2P8iIDvx7PZf5F3SIf/IzB9hxio1RYf0g9q//48w3+wmBg3LdMRCfL3sXG2EOA/fy
	m08dbVkXccjOMx8dz922w578NwwF6wnjbgRaKLO29RMOh1NoK+GU03X7tcTGIWlDCI+Wj+Zt3KX8M
	BnXpuuKeKK/ZruxWWzTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1td4Bp-00000006d3r-1wMB;
	Wed, 29 Jan 2025 09:16:53 +0000
Received: from esa3.hc555-34.eu.iphmx.com ([207.54.77.50])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1td4Bj-00000006d2N-3JyM
	for linux-riscv@lists.infradead.org;
	Wed, 29 Jan 2025 09:16:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=mobileye.com; i=@mobileye.com; q=dns/txt; s=MoEyIP;
  t=1738142207; x=1769678207;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=RuLMyg00bccCqWy5ag3jnD3Wp6i4VgyvkXDG4+7ywCc=;
  b=XWIFWXXT9scOvXaOr5Kg1GqmCz+/Jwk5256Aaf2xI738LPaelMXqZPAK
   ntcdzbzRa5bm0tje0kZOGOUzxOauAYfbHUcY7eV4sMtHPpJqEnWfqCo5H
   DVa6S5PKVL0OxNANkKQ5WnfTAhlh4aBKD4gY2pxF/6ffld4T6I7d7speJ
   Wl9nSOTPPvnNyG7FlNHXBrNnJIO0rFKJf3E1G1ra485DkLfgLStwZfRSd
   xM/h04j0bxVfBy8ZrpJOdSD/1rcNko4sQHEvi/ZXjgGgSJiZT8nMQxf2B
   RTyosAmj/nllZUzlAm3EFBQkORljRatVKXcYAcgHJV+55b5ETfWYJsJ0/
   A==;
X-CSE-ConnectionGUID: vZ3/icCeRI61AiJMgzrgqg==
X-CSE-MsgGUID: V/nDsDSjRkyhxc9AR4IfxA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from unknown (HELO ces01_data.me-corp.lan) ([146.255.191.134])
  by esa3.hc555-34.eu.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2025 11:16:43 +0200
X-CSE-ConnectionGUID: tbf5rMDISg2CrWsetK4ZqA==
X-CSE-MsgGUID: POnzwu9sQI+9OTm8Qn89Kw==
Received: from unknown (HELO epgd022.me-corp.lan) ([10.154.54.6])
  by ces01_data.me-corp.lan with SMTP; 29 Jan 2025 11:16:42 +0200
Received: by epgd022.me-corp.lan (sSMTP sendmail emulation); Wed, 29 Jan 2025 11:16:42 +0200
From: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
To: Anup Patel <anup@brainfault.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
Subject: [PATCH v5 1/2] dt-bindings: interrupt-controller: add risc-v,aplic hart indexes
Date: Wed, 29 Jan 2025 11:16:36 +0200
Message-ID: <20250129091637.1667279-2-vladimir.kondratiev@mobileye.com>
In-Reply-To: <20250129091637.1667279-1-vladimir.kondratiev@mobileye.com>
References: <87ed0o87qg.ffs@tglx>
 <20250129091637.1667279-1-vladimir.kondratiev@mobileye.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250129_011648_180016_FB5D88ED 
X-CRM114-Status: GOOD (  14.95  )
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

RG9jdW1lbnQgb3B0aW9uYWwgcHJvcGVydHkgInJpc2N2LGhhcnQtaW5kZXhlcyIKClJpc2MtViBB
UExJQyBzcGVjaWZpY2F0aW9uIGRlZmluZXMgImhhcnQgaW5kZXgiIGluIFsxXToKCldpdGhpbiBh
IGdpdmVuIGludGVycnVwdCBkb21haW4sIGVhY2ggb2YgdGhlIGRvbWFpbuKAmXMgaGFydHMgaGFz
IGEKdW5pcXVlIGluZGV4IG51bWJlciBpbiB0aGUgcmFuZ2UgMCB0byAyXjE0IOKIkiAxICg9IDE2
LDM4MykuIFRoZSBpbmRleApudW1iZXIgYSBkb21haW4gYXNzb2NpYXRlcyB3aXRoIGEgaGFydCBt
YXkgb3IgbWF5IG5vdCBoYXZlIGFueQpyZWxhdGlvbnNoaXAgdG8gdGhlIHVuaXF1ZSBoYXJ0IGlk
ZW50aWZpZXIgKOKAnGhhcnQgSUTigJ0pIHRoYXQgdGhlClJJU0MtViBQcml2aWxlZ2VkIEFyY2hp
dGVjdHVyZSBhc3NpZ25zIHRvIHRoZSBoYXJ0LiBUd28gZGlmZmVyZW50CmludGVycnVwdCBkb21h
aW5zIG1heSBlbXBsb3kgZW50aXJlbHkgZGlmZmVyZW50IGluZGV4IG51bWJlcnMgZm9yCnRoZSBz
YW1lIHNldCBvZiBoYXJ0cy4KCkZ1cnRoZXIsIHRoaXMgZG9jdW1lbnQgc2F5cyBpbiAiNC41IE1l
bW9yeS1tYXBwZWQgY29udHJvbApyZWdpb24gZm9yIGFuIGludGVycnVwdCBkb21haW4iOgoKVGhl
IGFycmF5IG9mIElEQyBzdHJ1Y3R1cmVzIG1heSBpbmNsdWRlIHNvbWUgZm9yIHBvdGVudGlhbCBo
YXJ0IGluZGV4Cm51bWJlcnMgdGhhdCBhcmUgbm90IGFjdHVhbCBoYXJ0IGluZGV4IG51bWJlcnMg
aW4gdGhlIGRvbWFpbi4gRm9yCmV4YW1wbGUsIHRoZSBmaXJzdCBJREMgc3RydWN0dXJlIGlzIGFs
d2F5cyBmb3IgaGFydCBpbmRleCAwLCBidXQgMCBpcwpub3QgbmVjZXNzYXJpbHkgYSB2YWxpZCBp
bmRleCBudW1iZXIgZm9yIGFueSBoYXJ0IGluIHRoZSBkb21haW4uCgpTdXBwb3J0IGFyYml0cmFy
eSBoYXJ0IGluZGV4ZXMgc3BlY2lmaWVkIGluIG9wdGlvbmFsIEFQTElDIHByb3BlcnR5CiJyaXNj
dixoYXJ0LWluZGV4ZXMiIHRoYXQgc2hvdWxkIGJlIGFycmF5IG9mIHUzMiBlbGVtZW50cywgb25l
IHBlcgppbnRlcnJ1cHQgdGFyZ2V0LiBJZiB0aGlzIHByb3BlcnR5IG5vdCBzcGVjaWZpZWQsIGZh
bGxiYWNrIGlzIHRvIHVzZQpsb2dpY2FsIGhhcnQgaW5kZXhlcyB3aXRoaW4gdGhlIGRvbWFpbi4K
ClsxXTogaHR0cHM6Ly9naXRodWIuY29tL3Jpc2N2L3Jpc2N2LWFpYQoKU2lnbmVkLW9mZi1ieTog
VmxhZGltaXIgS29uZHJhdGlldiA8dmxhZGltaXIua29uZHJhdGlldkBtb2JpbGV5ZS5jb20+ClJl
dmlld2VkLWJ5OiBBbnVwIFBhdGVsIDxhbnVwQGJyYWluZmF1bHQub3JnPgotLS0KIC4uLi9iaW5k
aW5ncy9pbnRlcnJ1cHQtY29udHJvbGxlci9yaXNjdixhcGxpYy55YW1sICAgICAgICB8IDggKysr
KysrKysKIDEgZmlsZSBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9Eb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvaW50ZXJydXB0LWNvbnRyb2xsZXIvcmlzY3Ys
YXBsaWMueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9pbnRlcnJ1cHQt
Y29udHJvbGxlci9yaXNjdixhcGxpYy55YW1sCmluZGV4IDE5MGE2NDk5YzkzMi4uYmVmMDA1MjFk
NWRhIDEwMDY0NAotLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvaW50ZXJy
dXB0LWNvbnRyb2xsZXIvcmlzY3YsYXBsaWMueWFtbAorKysgYi9Eb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvaW50ZXJydXB0LWNvbnRyb2xsZXIvcmlzY3YsYXBsaWMueWFtbApAQCAt
OTEsNiArOTEsMTQgQEAgcHJvcGVydGllczoKICAgICAgIEZpcm13YXJlIG11c3QgY29uZmlndXJl
IGludGVycnVwdCBkZWxlZ2F0aW9uIHJlZ2lzdGVycyBiYXNlZCBvbgogICAgICAgaW50ZXJydXB0
IGRlbGVnYXRpb24gbGlzdC4KIAorICByaXNjdixoYXJ0LWluZGV4ZXM6CisgICAgJHJlZjogL3Nj
aGVtYXMvdHlwZXMueWFtbCMvZGVmaW5pdGlvbnMvdWludDMyLWFycmF5CisgICAgbWluSXRlbXM6
IDEKKyAgICBtYXhJdGVtczogMTYzODQKKyAgICBkZXNjcmlwdGlvbjoKKyAgICAgIEEgbGlzdCBv
ZiBoYXJ0IGluZGV4ZXMgdGhhdCBBUExJQyBzaG91bGQgdXNlIHRvIGFkZHJlc3MgZWFjaCBoYXJ0
CisgICAgICB0aGF0IGlzIG1lbnRpb25lZCBpbiB0aGUgImludGVycnVwdHMtZXh0ZW5kZWQiCisK
IGRlcGVuZGVuY2llczoKICAgcmlzY3YsZGVsZWdhdGlvbjogWyAicmlzY3YsY2hpbGRyZW4iIF0K
IAotLSAKMi40My4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1y
aXNjdgo=
