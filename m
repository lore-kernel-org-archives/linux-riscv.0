Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 257E9E75458
	for <linux-riscv@archiver.kernel.org>; Wed, 24 Dec 2025 13:53:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=xW4BxxDq/l/2uDqlNHSGt5TftQC23k/I3QpDYMZicmA=; b=zOnRfZI/sVvDIE
	4zzq4HSLS5/0LPJvJ2t80+AlJHLSc7w1TbHlxWrSnSSSHw16pBvV5QLv0MM+pJ0d/dkMTNgJC2fRb
	71uA2+dt10vGqX8xJsVN9w3Tb9rx6AQcvImTLUW8GZqDP8cHitynkB++fBS++x8PP5uxETHlbPiDJ
	IkMtDlHIEKs6uscBwx86x0Qu0UWFTa7NiHF/7vicyCQxWf+bZpoAK2OLKMuwIeoukZvgv9Kn6h2jC
	UZFzut2roWCDtmLlT/Y6QpjeRwxbNkVG8CJ9e0mN9iYf/+1Wmw9QbvXnSuU+lE5qVl41eFpfDsDBO
	qrHsQJrpmkBb5CNTf5BQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYPIT-0000000GvVT-0Zzz;
	Wed, 24 Dec 2025 13:53:01 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYPIO-0000000GvT9-0qEb
	for linux-riscv@lists.infradead.org;
	Wed, 24 Dec 2025 13:52:59 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-430f9ffd4e8so3291856f8f.0
        for <linux-riscv@lists.infradead.org>; Wed, 24 Dec 2025 05:52:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=osyx-tech.20230601.gappssmtp.com; s=20230601; t=1766584373; x=1767189173; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DmuPTBK1+j/xQcR53nZlLGqYmcBMfxzHRcOOd3xh0JY=;
        b=Y0kNAiN9zB8FooflWiD5FPMgWkPuw6sg0IS/0P5LFuYKuswv7eon5EMFrInVssTrVW
         G1TXJzVjrZuqg5Jt89R2iaCiOd3DnQIoYjzLxIVxHx311CC3YzU+P3fvprYcvw7cRbdb
         1nfQ5PcvsPKybhTT4EOv62LZCuO0wKnuhW3HBQg187NLwv0RFdYjxEIzj+mAyasodAZk
         lT5jt+jcaPac/4eWPasHppILmoTKI2d6bDGuPNSGOmaASTKRTQ3DQXlzWx60Ds9szY54
         syb+V3ZjnLR5cecwSS85HKCqva14FJv2IGZ+Gydke/DRt5y6ywfilw4kVrCeNkLaEOWV
         xkPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766584373; x=1767189173;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DmuPTBK1+j/xQcR53nZlLGqYmcBMfxzHRcOOd3xh0JY=;
        b=dUsPqRfZ5pywCQUSlxqf6FbTosUg1+9qlx5xznig9GxVXdgRiOEGmzpUJbCuZC9xBy
         J5GciOJwAj6V5SZ9XDvPUyIu7dx5yyeGTqVune0aCJDPdncBECRKFCoPEfP+MhUAUO7L
         zlt3oMCUzdNUaq6littbMqEzCmKFsIU263LMYH0lYl+IW2SWGWCXftPd8p/tpCpPOPXf
         8UOyhfxCbpO6kw8OGiRRUAmmRb1g3CXXgzf2XFzsysGzCbN9KYM7NfezTMHnQE3pAylN
         eIn2TXyp+Ds0LsOA9LeC237+Y0O4s5bLXYEByJahPXdwK2WNx/FFgr4GMA+zEF7uRXTH
         vVtw==
X-Forwarded-Encrypted: i=1; AJvYcCULS/hzqSOn/MALGL8Ws1N7+WLXA+Fpdu/8/oW4TXKsdVPv81ZVlNJHKP7N6f5X1ucyScGCdlp78JE7CQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywb67vAI4D98s1VNJ1BG3VYGY3b15g8Pse0lSICNiK4qM3VgfHk
	WrcgSDl1jsZqiUsHCYLIr2j3vtDXJy+kF0YYDflSYQRuN9bMXgR56KcXW88+kQYCh31S
X-Gm-Gg: AY/fxX4/PtffA1ZgnP0bOemCyHvLK9pZFxUvuYUfguW38CyCgzuaPInKS5+ZsKE1Rb8
	K9DDJm32lYaiE+bYsEg1pbdWjN4jLHz2vy4F0nLK6YLotx3Ki/d2pAsuUB1Q3Zwplx+RSLBKzE/
	3AleDJJUjkj7FTzYLqjgQOospJIEPD7h92LdKgjFbwX+f35cXMSSwb0N9a3AhQ3t1tCUsbNQBsB
	l0t/1sU/O+WWkowSfMVHGgcZjds1zNRlMO3i+sVv09Agr4gvOFAn7JaMiECAyO+8M8pD/2+M3M7
	VuDqCIeriqN+qrS+FHMR/gEFVrBBuU7CnfB/eGJkkJR/EqF54QLt878ABuAh13SPYu6RDX/O0cz
	QaWzSWK5Yol0/pTK/h+QfwRfE9W2fAdB2SCSitIUQ1YM3WwX+z/i2GELiVlRTWHTE4HLtdGrC2P
	8SgP/IJTQ+GKgmwSmBhg==
X-Google-Smtp-Source: AGHT+IHoJrb07B1cdykCE7qYkiqA5eIOoSQMy9mbNo39VeuUJ9/LLv9crUrYThO0HyLNCGIS21PtnA==
X-Received: by 2002:a5d:5d02:0:b0:431:66a:cbda with SMTP id ffacd0b85a97d-4324425829amr25725416f8f.0.1766584372997;
        Wed, 24 Dec 2025 05:52:52 -0800 (PST)
Received: from jp-linux.Home ([2001:8a0:f59c:a900:39e4:e84d:192a:5c5c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324eaa64cesm34494677f8f.35.2025.12.24.05.52.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Dec 2025 05:52:52 -0800 (PST)
From: joaopeixoto@osyx.tech
To: linux-kernel@vger.kernel.org
Cc: ajd@linux.ibm.com,
	alex@ghiti.fr,
	aou@eecs.berkeley.edu,
	bagasdotme@gmail.com,
	catalin.marinas@arm.com,
	conor+dt@kernel.org,
	corbet@lwn.net,
	dan.j.williams@intel.com,
	davidmcerdeira@osyx.tech,
	devicetree@vger.kernel.org,
	dev@kael-k.io,
	gregkh@linuxfoundation.org,
	haren@linux.ibm.com,
	heiko@sntech.de,
	joaopeixoto@osyx.tech,
	jose@osyx.tech,
	kever.yang@rock-chips.com,
	krzk+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux@armlinux.org.uk,
	linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	maddy@linux.ibm.com,
	mani@kernel.org,
	nathan@kernel.org,
	neil.armstrong@linaro.org,
	palmer@dabbelt.com,
	pjw@kernel.org,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	robh@kernel.org,
	will@kernel.org
Subject: [PATCH 0/5] virt: Add Bao hypervisor IPC and I/O dispatcher drivers
Date: Wed, 24 Dec 2025 13:52:12 +0000
Message-ID: <20251224135217.25350-1-joaopeixoto@osyx.tech>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251224_055256_599047_59FE5E24 
X-CRM114-Status: GOOD (  11.36  )
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

RnJvbTogSm/Do28gUGVpeG90byA8am9hb3BlaXhvdG9Ab3N5eC50ZWNoPgoKVGhpcyBzZXJpZXMg
aW50cm9kdWNlcyBzdXBwb3J0IGZvciB0aGUgQmFvIGh5cGVydmlzb3IgZ3Vlc3Qtc2lkZSBkcml2
ZXJzCnVuZGVyIGRyaXZlcnMvdmlydC9iYW8gYW5kIHRoZSBhc3NvY2lhdGVkIERldmljZSBUcmVl
IGJpbmRpbmdzLCBVQVBJLAphbmQgTUFJTlRBSU5FUlMgZW50cmllcy4KCkJhbyBpcyBhIGxpZ2h0
d2VpZ2h0IHN0YXRpYy1wYXJ0aXRpb25pbmcgaHlwZXJ2aXNvciBmb3IgZW1iZWRkZWQgYW5kCnNh
ZmV0eS1jcml0aWNhbCBzeXN0ZW1zLiBUaGlzIHNlcmllcyBhZGRzOgotIFRoZSBCYW8gSVBDIHNo
YXJlZCBtZW1vcnkgZHJpdmVyLCB3aGljaCBlbmFibGVzIExpbnV4IGd1ZXN0cyB0bwogIGNvbW11
bmljYXRlIHdpdGggZWFjaCBvdGhlciB0aHJvdWdoIHNoYXJlZCBtZW1vcnkgcmVnaW9ucy4KLSBU
aGUgQmFvIEkvTyBEaXNwYXRjaGVyIGRyaXZlciwgd2hpY2ggYWxsb3dzIEJhbydzIFZNcyB0byBz
aGFyZSBJL08KICBkZXZpY2VzIHVzaW5nIGRldmljZSBwYXJhdmlydHVhbGl6YXRpb24gKFZpcnRJ
TykuCgpQYXRjaCBvdmVydmlldzoKCjEuIGR0LWJpbmRpbmdzOiBBZGQgQmFvIElQQyBzaGFyZWQg
bWVtb3J5IGRyaXZlciBiaW5kaW5nCiAgIC0gUHJvdmlkZXMgYSBzdGFuZGFyZGl6ZWQgRFQgZGVz
Y3JpcHRpb24gZm9yIEJhbyBJUEMgc2hhcmVkIG1lbW9yeQogICAgIGRldmljZXMgdXNlZCBmb3Ig
aW50ZXItVk0gY29tbXVuaWNhdGlvbi4KCjIuIHZpcnQ6IGFkZCBCYW8gSVBDIHNoYXJlZCBtZW1v
cnkgZHJpdmVyCiAgIC0gQ2hhcmFjdGVyIGRldmljZSBkcml2ZXIgdGhhdCBtYXBzIHNoYXJlZC1t
ZW1vcnkgcmVnaW9ucyBhbmQKICAgICBjb21tdW5pY2F0ZXMgd2l0aCB0aGUgaHlwZXJ2aXNvciB2
aWEgYXJjaGl0ZWN0dXJlLXNwZWNpZmljIGh5cGVyY2FsbHMKICAgICAoU01DL0hWQyBvbiBBUk0s
IFNCSSBlY2FsbCBvbiBSSVNDLVYpLgoKMy4gZHQtYmluZGluZ3M6IEFkZCBCYW8gSS9PIGRpc3Bh
dGNoZXIgZHJpdmVyIGJpbmRpbmcKICAgLSBEVCBiaW5kaW5nIGZvciB0aGUgQmFvIEkvTyBEaXNw
YXRjaGVyLCBkZXNjcmliaW5nIG1lbW9yeSByZWdpb25zLAogICAgIGludGVycnVwdHMsIGFuZCBj
b21wYXRpYmxlIHN0cmluZ3MgZm9yIGJhY2tlbmQgVk1zLgoKNC4gdmlydDogYWRkIEJhbyBJL08g
ZGlzcGF0Y2hlciBkcml2ZXIKICAgLSBJbXBsZW1lbnRzIHRoZSBJL08gRGlzcGF0Y2hlciBrZXJu
ZWwgbW9kdWxlIGJyaWRnaW5nIEJhbyBSZW1vdGUgSS9PCiAgICAgd2l0aCBWaXJ0SU8gYmFja2Vu
ZCBkZXZpY2VzLgogICAtIEluY2x1ZGVzIGFyY2hpdGVjdHVyZS1zcGVjaWZpYyBoZWFkZXJzIGZv
ciBBUk0sIEFSTTY0LCBhbmQgUklTQy1WLAogICAgIGRyaXZlciBmcmFtZXdvcmsgZmlsZXMsIFVB
UEkgaGVhZGVycywgS2NvbmZpZy9NYWtlZmlsZSBpbnRlZ3JhdGlvbiwKICAgICBhbmQgaW9jdGwg
ZG9jdW1lbnRhdGlvbi4KCjUuIE1BSU5UQUlORVJTOiBBZGQgZW50cmllcyBmb3IgQmFvIGh5cGVy
dmlzb3IgZHJpdmVycwogICAtIFJlZ2lzdGVycyBtYWludGFpbmVycyBmb3IgYWxsIEJhbyBoeXBl
cnZpc29yIGNvbXBvbmVudHMgdG8gZW5zdXJlCiAgICAgcHJvcGVyIGtlcm5lbCByZXZpZXcgYW5k
IG5vdGlmaWNhdGlvbnMuCgpUaGlzIHNlcmllcyBoYXMgYmVlbiB2YWxpZGF0ZWQgb24gTGludXgg
Z3Vlc3RzIHJ1bm5pbmcgdW5kZXIgQmFvIGh5cGVydmlzb3IsCmVuc3VyaW5nIGNvcnJlY3QgaW5p
dGlhbGl6YXRpb24sIHJlYWQvd3JpdGUgb3BlcmF0aW9ucyBmb3IgSVBDIHNoYXJlZAptZW1vcnks
IGFuZCBwcm9wZXIgSS9PIERpc3BhdGNoZXIgZnVuY3Rpb25hbGl0eSBmb3IgYmFja2VuZCBWTXMu
CgpGZWVkYmFjayBhbmQgcmV2aWV3IGZyb20gbWFpbnRhaW5lcnMgb2YgdmlydHVhbGl6YXRpb24s
IGFyY2hpdGVjdHVyZS1zcGVjaWZpYwpjb2RlIChBUk0sIEFSTTY0LCBSSVNDLVYpLCBEZXZpY2Ug
VHJlZSBiaW5kaW5ncywgYW5kIFVBUEkgYXJlIHdlbGNvbWUuCgpKb8OjbyBQZWl4b3RvICg1KToK
ICBkdC1iaW5kaW5nczogQWRkIEJhbyBJUEMgc2hhcmVkIG1lbW9yeSBkcml2ZXIgYmluZGluZwog
IHZpcnQ6IGFkZCBCYW8gSVBDIHNoYXJlZCBtZW1vcnkgZHJpdmVyCiAgZHQtYmluZGluZ3M6IEFk
ZCBCYW8gSS9PIGRpc3BhdGNoZXIgZHJpdmVyIGJpbmRpbmcKICB2aXJ0OiBhZGQgQmFvIEkvTyBk
aXNwYXRjaGVyIGRyaXZlcgogIE1BSU5UQUlORVJTOiBBZGQgZW50cmllcyBmb3IgQmFvIGh5cGVy
dmlzb3IgZHJpdmVycywgaGVhZGVycywgYW5kIERUCiAgICBiaW5kaW5ncwoKIC4uLi9iaW5kaW5n
cy9iYW8vaW8tZGlzcGF0Y2hlci55YW1sICAgICAgICAgICB8ICA2NyArKysKIC4uLi9kZXZpY2V0
cmVlL2JpbmRpbmdzL2Jhby9pcGNzaG1lbS55YW1sICAgICB8ICA5OSArKysrCiAuLi4vZGV2aWNl
dHJlZS9iaW5kaW5ncy92ZW5kb3ItcHJlZml4ZXMueWFtbCAgfCAgIDIgKwogLi4uL3VzZXJzcGFj
ZS1hcGkvaW9jdGwvaW9jdGwtbnVtYmVyLnJzdCAgICAgIHwgICAyICsKIE1BSU5UQUlORVJTICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAxMiArCiBhcmNoL2FybS9pbmNsdWRl
L2FzbS9iYW8uaCAgICAgICAgICAgICAgICAgICAgfCAgNjIgKysKIGFyY2gvYXJtNjQvaW5jbHVk
ZS9hc20vYmFvLmggICAgICAgICAgICAgICAgICB8ICA2MiArKwogYXJjaC9yaXNjdi9pbmNsdWRl
L2FzbS9iYW8uaCAgICAgICAgICAgICAgICAgIHwgIDYxICsrCiBkcml2ZXJzL3ZpcnQvS2NvbmZp
ZyAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgIDIgKwogZHJpdmVycy92aXJ0L01ha2VmaWxl
ICAgICAgICAgICAgICAgICAgICAgICAgIHwgICAyICsKIGRyaXZlcnMvdmlydC9iYW8vS2NvbmZp
ZyAgICAgICAgICAgICAgICAgICAgICB8ICAgNSArCiBkcml2ZXJzL3ZpcnQvYmFvL01ha2VmaWxl
ICAgICAgICAgICAgICAgICAgICAgfCAgIDQgKwogZHJpdmVycy92aXJ0L2Jhby9pby1kaXNwYXRj
aGVyL0tjb25maWcgICAgICAgIHwgIDE2ICsKIGRyaXZlcnMvdmlydC9iYW8vaW8tZGlzcGF0Y2hl
ci9NYWtlZmlsZSAgICAgICB8ICAgNCArCiBkcml2ZXJzL3ZpcnQvYmFvL2lvLWRpc3BhdGNoZXIv
YmFvX2Rydi5oICAgICAgfCAzODYgKysrKysrKysrKysrKwogZHJpdmVycy92aXJ0L2Jhby9pby1k
aXNwYXRjaGVyL2RtLmMgICAgICAgICAgIHwgMzMwICsrKysrKysrKysrCiBkcml2ZXJzL3ZpcnQv
YmFvL2lvLWRpc3BhdGNoZXIvZHJpdmVyLmMgICAgICAgfCAzNDggKysrKysrKysrKysKIGRyaXZl
cnMvdmlydC9iYW8vaW8tZGlzcGF0Y2hlci9oeXBlcmNhbGwuaCAgICB8ICAzMCArCiBkcml2ZXJz
L3ZpcnQvYmFvL2lvLWRpc3BhdGNoZXIvaW50Yy5jICAgICAgICAgfCAgNjggKysrCiBkcml2ZXJz
L3ZpcnQvYmFvL2lvLWRpc3BhdGNoZXIvaW9fY2xpZW50LmMgICAgfCA0MzUgKysrKysrKysrKysr
KysKIC4uLi92aXJ0L2Jhby9pby1kaXNwYXRjaGVyL2lvX2Rpc3BhdGNoZXIuYyAgICB8IDIwNyAr
KysrKysrCiBkcml2ZXJzL3ZpcnQvYmFvL2lvLWRpc3BhdGNoZXIvaW9jdGxzLmMgICAgICAgfCAx
NDUgKysrKysKIGRyaXZlcnMvdmlydC9iYW8vaW8tZGlzcGF0Y2hlci9pb2V2ZW50ZmQuYyAgICB8
IDMzNiArKysrKysrKysrKwogZHJpdmVycy92aXJ0L2Jhby9pby1kaXNwYXRjaGVyL2lycWZkLmMg
ICAgICAgIHwgMzQxICsrKysrKysrKysrCiBkcml2ZXJzL3ZpcnQvYmFvL2lwY3NobWVtL0tjb25m
aWcgICAgICAgICAgICAgfCAgIDkgKwogZHJpdmVycy92aXJ0L2Jhby9pcGNzaG1lbS9NYWtlZmls
ZSAgICAgICAgICAgIHwgICAzICsKIGRyaXZlcnMvdmlydC9iYW8vaXBjc2htZW0vaXBjc2htZW0u
YyAgICAgICAgICB8IDUzOSArKysrKysrKysrKysrKysrKysKIGluY2x1ZGUvdWFwaS9saW51eC9i
YW8uaCAgICAgICAgICAgICAgICAgICAgICB8IDEyNCArKysrCiAyOCBmaWxlcyBjaGFuZ2VkLCAz
NzAxIGluc2VydGlvbnMoKykKIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvYmFvL2lvLWRpc3BhdGNoZXIueWFtbAogY3JlYXRlIG1vZGUgMTAwNjQ0
IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9iYW8vaXBjc2htZW0ueWFtbAogY3Jl
YXRlIG1vZGUgMTAwNjQ0IGFyY2gvYXJtL2luY2x1ZGUvYXNtL2Jhby5oCiBjcmVhdGUgbW9kZSAx
MDA2NDQgYXJjaC9hcm02NC9pbmNsdWRlL2FzbS9iYW8uaAogY3JlYXRlIG1vZGUgMTAwNjQ0IGFy
Y2gvcmlzY3YvaW5jbHVkZS9hc20vYmFvLmgKIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL3Zp
cnQvYmFvL0tjb25maWcKIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL3ZpcnQvYmFvL01ha2Vm
aWxlCiBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy92aXJ0L2Jhby9pby1kaXNwYXRjaGVyL0tj
b25maWcKIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL3ZpcnQvYmFvL2lvLWRpc3BhdGNoZXIv
TWFrZWZpbGUKIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL3ZpcnQvYmFvL2lvLWRpc3BhdGNo
ZXIvYmFvX2Rydi5oCiBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy92aXJ0L2Jhby9pby1kaXNw
YXRjaGVyL2RtLmMKIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL3ZpcnQvYmFvL2lvLWRpc3Bh
dGNoZXIvZHJpdmVyLmMKIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL3ZpcnQvYmFvL2lvLWRp
c3BhdGNoZXIvaHlwZXJjYWxsLmgKIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL3ZpcnQvYmFv
L2lvLWRpc3BhdGNoZXIvaW50Yy5jCiBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy92aXJ0L2Jh
by9pby1kaXNwYXRjaGVyL2lvX2NsaWVudC5jCiBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy92
aXJ0L2Jhby9pby1kaXNwYXRjaGVyL2lvX2Rpc3BhdGNoZXIuYwogY3JlYXRlIG1vZGUgMTAwNjQ0
IGRyaXZlcnMvdmlydC9iYW8vaW8tZGlzcGF0Y2hlci9pb2N0bHMuYwogY3JlYXRlIG1vZGUgMTAw
NjQ0IGRyaXZlcnMvdmlydC9iYW8vaW8tZGlzcGF0Y2hlci9pb2V2ZW50ZmQuYwogY3JlYXRlIG1v
ZGUgMTAwNjQ0IGRyaXZlcnMvdmlydC9iYW8vaW8tZGlzcGF0Y2hlci9pcnFmZC5jCiBjcmVhdGUg
bW9kZSAxMDA2NDQgZHJpdmVycy92aXJ0L2Jhby9pcGNzaG1lbS9LY29uZmlnCiBjcmVhdGUgbW9k
ZSAxMDA2NDQgZHJpdmVycy92aXJ0L2Jhby9pcGNzaG1lbS9NYWtlZmlsZQogY3JlYXRlIG1vZGUg
MTAwNjQ0IGRyaXZlcnMvdmlydC9iYW8vaXBjc2htZW0vaXBjc2htZW0uYwogY3JlYXRlIG1vZGUg
MTAwNjQ0IGluY2x1ZGUvdWFwaS9saW51eC9iYW8uaAoKLS0gCjIuNDMuMAoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcg
bGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
