Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35AD7C7EE2A
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Jun 2025 18:29:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iUH9xrzJXL10DmVqtxv0SURmUz2+bJIyyXe8C7H66PM=; b=ZlZRCTwPQQxG3O
	tkftKLTL8EEKwV9W/XRoW9qtP+VBhO5++Stzfk1vBnSKP5I/655SGztPITnatkQ3eH6+R85XvfJ7/
	cLhCm2u7ZECEXsq43mRv7f/JKTed/iffHumosXBgvr2MsQs6cicyZ8VgfVxz6Jv5Rl2SUx7HtVBbB
	cJ/JBAdsPEwrTFpbZ8PLW1OjYnfH4cIpbsn21e35CjnlBxshkEw9crgHyeoochUpuNgb3gjfkReZj
	zBc8V/rfMIZrDBrUkFGhy+wdK7A1k9TsDXKPLNmTrEppOrs1a3wPglzJobTPNK1qSjt8WdsikCJW8
	Yewg2v8eZ96v3hxtNABg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUUrm-00000009ZL9-0dN6;
	Wed, 25 Jun 2025 18:29:02 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUQzl-00000008wWZ-0Njo
	for linux-riscv@lists.infradead.org;
	Wed, 25 Jun 2025 14:21:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id F1803A526E3;
	Wed, 25 Jun 2025 14:20:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 91366C4CEEA;
	Wed, 25 Jun 2025 14:20:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750861259;
	bh=GKbzOIdtzFvop5ar2d9+3emwLLF5QXNzgs6b3CUkOPk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=flDlzeJnraRftrK84Q+l68/q/JKOEfSgZhA69SlgO8yO+F9A1fEf7ng+zjIViJzs7
	 ZA9xWqh9g40IUaVwyRpV3XOzl00L9NIvk/0hhnsrxLvRpxqQrR2TvtQ6Bt8fUxCWCB
	 hL/0es/zvq16yRcaRGV6X5Te0cpG7lJ81cR0VJQ6olIXCtNIK91TB7YcgFTvT2LkDy
	 C1vzQW1Ev4O7Ki8iv7RM0d2QARCni3nXLyRe1I5wdjhl1oVvH7hvjabf5wQ06fXTxZ
	 qKHPOgp75vG4+ZhvpHi0FbWejHOBxx1nFrYKzY+sKh93l1mu3oBoUGgbjlTRo7vetE
	 0qGeMVrsWsHNA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77C42C7115C;
	Wed, 25 Jun 2025 14:20:59 +0000 (UTC)
From: Aleksa Paunovic via B4 Relay <devnull+aleksa.paunovic.htecgroup.com@kernel.org>
Date: Wed, 25 Jun 2025 16:20:56 +0200
Subject: [PATCH v4 1/7] dt-bindings: riscv: Add xmipsexectl ISA extension
 description
MIME-Version: 1.0
Message-Id: <20250625-p8700-pause-v4-1-6c7dd7f85756@htecgroup.com>
References: <20250625-p8700-pause-v4-0-6c7dd7f85756@htecgroup.com>
In-Reply-To: <20250625-p8700-pause-v4-0-6c7dd7f85756@htecgroup.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Jonathan Corbet <corbet@lwn.net>
Cc: Palmer Dabbelt <palmer@sifive.com>, Conor Dooley <conor@kernel.org>, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750861257; l=1302;
 i=aleksa.paunovic@htecgroup.com; s=20250514; h=from:subject:message-id;
 bh=h13o/f46vhfOxj3D4iHSUN8apIuhKjiCZWPiTgA7Dm8=;
 b=bybQmtA8JYGfk8SiLTuOilDEXK5tT9xmFca05oXB0CyhBAtjNDrFXIGgHUHKdAijZXjcbV3p1
 JgyhwV4egd+C8PDaz7ap5wnXKVTad51WO59WymZenWRomONPsWUPyfr
X-Developer-Key: i=aleksa.paunovic@htecgroup.com; a=ed25519;
 pk=gFVSVYLKAgJiS5qCnDyUMGOFuczv8C6o0UmRs+fgisA=
X-Endpoint-Received: by B4 Relay for aleksa.paunovic@htecgroup.com/20250514
 with auth_id=403
X-Original-From: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_072101_276612_89DC7D5A 
X-CRM114-Status: UNSURE (   6.42  )
X-CRM114-Notice: Please train this message.
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
Reply-To: aleksa.paunovic@htecgroup.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

RnJvbTogQWxla3NhIFBhdW5vdmljIDxhbGVrc2EucGF1bm92aWNAaHRlY2dyb3VwLmNvbT4KClRo
ZSB4bWlwc2V4ZWN0bCBleHRlbnNpb24gaXMgZGVzY3JpYmVkIGluIHRoZSBNSVBTIFJWNjQgUDg3
MDAvUDg3MDAtRgpNdWx0aXByb2Nlc3NpbmcgU3lzdGVtIFByb2dyYW1tZXLigJlzIEd1aWRlIGxp
bmtlZCBhdCBbMV0uCgpMaW5rOiBodHRwczovL21pcHMuY29tL3dwLWNvbnRlbnQvdXBsb2Fkcy8y
MDI1LzA2L1A4NzAwX1Byb2dyYW1tZXJzX1JlZmVyZW5jZV9NYW51YWxfUmV2MS44NF81LTMxLTIw
MjUucGRmCgpTaWduZWQtb2ZmLWJ5OiBBbGVrc2EgUGF1bm92aWMgPGFsZWtzYS5wYXVub3ZpY0Bo
dGVjZ3JvdXAuY29tPgotLS0KIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9yaXNj
di9leHRlbnNpb25zLnlhbWwgfCA2ICsrKysrKwogMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9u
cygrKQoKZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9yaXNj
di9leHRlbnNpb25zLnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvcmlz
Y3YvZXh0ZW5zaW9ucy55YW1sCmluZGV4IGVkZTZhNThjY2Y1MzQ3ZDkyNzg1ZGMwODVhMDExMDUy
YzFhYWRlMTQuLmRlNDFhNmYwNzRkM2FmMmNlYWY1MjkzZGZlNzVkMTZmNDNkNDE2ZDYgMTAwNjQ0
Ci0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9yaXNjdi9leHRlbnNpb25z
LnlhbWwKKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Jpc2N2L2V4dGVu
c2lvbnMueWFtbApAQCAtNjYyLDYgKzY2MiwxMiBAQCBwcm9wZXJ0aWVzOgogICAgICAgICAgICAg
UmVnaXN0ZXJzIGluIHRoZSBBWDQ1TVAgZGF0YXNoZWV0LgogICAgICAgICAgICAgaHR0cHM6Ly93
d3cuYW5kZXN0ZWNoLmNvbS93cC1jb250ZW50L3VwbG9hZHMvQVg0NU1QLTFDLVJldi4tNS4wLjAt
RGF0YXNoZWV0LnBkZgogCisgICAgICAgICMgTUlQUworICAgICAgICAtIGNvbnN0OiB4bWlwc2V4
ZWN0bAorICAgICAgICAgIGRlc2NyaXB0aW9uOgorICAgICAgICAgICAgVGhlIE1JUFMgZXh0ZW5z
aW9uIGZvciBleGVjdXRpb24gY29udHJvbCBhcyBkb2N1bWVudGVkIGluCisgICAgICAgICAgICBo
dHRwczovL21pcHMuY29tL3dwLWNvbnRlbnQvdXBsb2Fkcy8yMDI1LzA2L1A4NzAwX1Byb2dyYW1t
ZXJzX1JlZmVyZW5jZV9NYW51YWxfUmV2MS44NF81LTMxLTIwMjUucGRmCisKICAgICAgICAgIyBT
aUZpdmUKICAgICAgICAgLSBjb25zdDogeHNmdnFtYWNjZG9kCiAgICAgICAgICAgZGVzY3JpcHRp
b246CgotLSAKMi4zNC4xCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtcmlzY3YK
