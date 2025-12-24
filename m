Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 529FEE7545C
	for <linux-riscv@archiver.kernel.org>; Wed, 24 Dec 2025 15:45:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZtDucjlMSjHdooLWa5ZzTyJ0gVpy4M7g7CFeHcd9yGw=; b=IkSiIdREzWbS7/
	EU97oGrYpRqhuJ2TbNHBKQY7Nh6PO4zxmnV5+lxwE+nW2AWWtylk15uTRVt54ALVg/ixj07dydBB+
	PN9OyRnQp/RV1xza1keujE1vgfLGWaovUASiRy49ROMDtxjRRNFa4BZJiXFJJ4kpSWzUhNDIebliN
	R3WNvxnicaVinO75yldLBPq26riHF5wDO9Fj1Dt3f63upCRf7vdxrPR8ZKQhRwggjLPGMUnBZwWir
	NLT5hGk6OzRT4kCHdd1bWD6IaPg3sitp9DnCDawp3JYkyKZMUb1rBsisDiyJOpm8Dv7N6+5wb8k5D
	zKgk1XF+Br17sitqzDTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYR2W-0000000H8rq-3b1y;
	Wed, 24 Dec 2025 15:44:41 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYR2R-0000000H8qW-3iwh
	for linux-riscv@lists.infradead.org;
	Wed, 24 Dec 2025 15:44:39 +0000
Received: by mail-wr1-x444.google.com with SMTP id ffacd0b85a97d-430f3ef2d37so4553970f8f.3
        for <linux-riscv@lists.infradead.org>; Wed, 24 Dec 2025 07:44:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=osyx-tech.20230601.gappssmtp.com; s=20230601; t=1766591074; x=1767195874; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ehfxbEVnQJDewCWJrGs2ak+KMNFyhQdtz7cgsTLXZDQ=;
        b=A5ezphOyKMPWjfxCBicEB27hzGYJoN+t8F6iQj/puvzATvRL9mkl0BSGG9b+dlDFvj
         Xqe1HXs8kYrsV9Gk2yA0LA2ebjoQkgHzpfFuZacKq0obqVkfNEBlbr39QJ15aMbRboYJ
         2XT+3mPoQY8WSMRI1DGk42hXEoPXSdm9p6397C677pVClqvC1K50bu1nBv4qPz/p3Htv
         sbgOr2sbsee7HHo+T53pfFFtwIzSSX7awcDrp9F3tTW3wJAFFIRoZoCq4DWloUoUEh+b
         Hq3GXNIIrlVXXkpMmWcU67no+/BELZLv6NWNB1LdkZWlcwm+J9tsjAZmDLc6f2Bleceh
         MzdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766591074; x=1767195874;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ehfxbEVnQJDewCWJrGs2ak+KMNFyhQdtz7cgsTLXZDQ=;
        b=N1KmNnyFJc8JOLYeTCjmcnDAaqstkTtrMEzIOEpi5/Y6jgJDcBH699Gi8aR757v7cq
         qjjdgPd/rwWMspczfwUABujM3Cil2s0fI5WkgwMWTNR9TxUNUIYqAlTKGYwmNtGShile
         tM2xRYkARVw6Nwk5wWzAO+fDEjpv7HO7iVNPBOz5Wga4sRGzAamOOMpSCMdF/SUAF+Sy
         HQnly3zr7962BvOxl4FtIP49NrD08pZbM1W65jVMMpPW8tVZoZqcIN9/6YgzD/G91on5
         m+uQL+EuOT9V6/QXayCQ1B/oQRtk+kDEaF4BvG6tTnddB6BScRVh7+QmrwSmeTTETkyy
         t5dw==
X-Forwarded-Encrypted: i=1; AJvYcCUmTyeGX9GYIa6q0I/SQSOlhB2SonC2lzwxqbbD6th3lKBshNSGKck/XG33gHicdgZ20574ErjWa2Du/Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YyhnsXsTITkS2KMGovzYaTr/x81buDx5+n2LdIKG6Q77vp/JLJM
	MsxaQ3/oFEEXqWc/Hru9tHYGFAVGTKIk7G8Fr9Lhd1NHTkWqDNdcLDOTBQtFjG8rPUU/H/OWK8W
	sJmVmebFP
X-Gm-Gg: AY/fxX77q8B1W6s5OTsauGnygBgiXx3WAOd0klHvEpKDXGe7ae0KUOrVP4QOu7lTnmc
	oN3UikcHfZjGBvw6pwIofV4q0G6sYFakfl9OmK0d3urdldnwDBpfS4fh6yO45zX11ftTzCWwXRo
	T5gOjlVVhcXYgr0mptMkHQCdMtyMHSyfMln5Z0ZB90hd9VcF5sy8tvpdJ4gFo0H+FafABuI7ht9
	LpvZqFDTZ6h3eSAdMUnLkWvnf8YT3TOW7o9e04KMOFQnwuAXYZn+tJIVqQjQ6hhOyix85/AZ/4h
	91PuxnHvUnzpZMXuAA4j5Fe5SZd+tq6EsqB9FawrIe+zoKEmoWZvwq1v50EEdp4iwJskRjlsYl8
	4vYtAsNGDUPoehWVck6XdYepjEMe/6JkJI4ftm3nFXtERmcdrQHpm11A0Mnu88TIPg51ORmONi0
	1jnHTc+It2t06m3Y0S7A==
X-Google-Smtp-Source: AGHT+IFqP19dt2VG1hPpM2WYJhNqheRS/5whksM3UdvdL2gWh2MKdA11saX7GOb3KMgk63dxD3aa3A==
X-Received: by 2002:a05:6000:2909:b0:42b:2dfd:5350 with SMTP id ffacd0b85a97d-4324e7077c8mr21170738f8f.56.1766584379482;
        Wed, 24 Dec 2025 05:52:59 -0800 (PST)
Received: from jp-linux.Home ([2001:8a0:f59c:a900:39e4:e84d:192a:5c5c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324eaa64cesm34494677f8f.35.2025.12.24.05.52.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Dec 2025 05:52:59 -0800 (PST)
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
Subject: [PATCH 1/5] dt-bindings: Add Bao IPC shared memory driver binding
Date: Wed, 24 Dec 2025 13:52:13 +0000
Message-ID: <20251224135217.25350-2-joaopeixoto@osyx.tech>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251224135217.25350-1-joaopeixoto@osyx.tech>
References: <20251224135217.25350-1-joaopeixoto@osyx.tech>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251224_074435_973399_A2E3F820 
X-CRM114-Status: GOOD (  18.97  )
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

RnJvbTogSm/Do28gUGVpeG90byA8am9hb3BlaXhvdG9Ab3N5eC50ZWNoPgoKVGhpcyBwYXRjaCBh
ZGRzIGEgRGV2aWNlIFRyZWUgYmluZGluZyBmb3IgdGhlIEJhbyBJUEMgc2hhcmVkIG1lbW9yeQpk
ZXZpY2UsIHdoaWNoIHByb3ZpZGVzIGEgc3RhbmRhcmRpemVkIGRlc2NyaXB0aW9uIG9mIHRoZSBo
YXJkd2FyZQppbnRlcmZhY2UgdXNlZCBmb3IgaW50ZXItVk0gY29tbXVuaWNhdGlvbiBpbiBCYW8t
YmFzZWQgc3lzdGVtcy4KClRoZSBiaW5kaW5nIGRvY3VtZW50cyB0aGUgZm9sbG93aW5nIHByb3Bl
cnRpZXM6CgogIC0gY29tcGF0aWJsZTogImJhbyxpcGNzaG1lbSIKICAtIHJlZzogTWVtb3J5IHJl
Z2lvbiBmb3IgdGhlIHNoYXJlZCBtZW1vcnkgZGV2aWNlCiAgLSBpZDogVW5pcXVlIGRldmljZSBp
ZGVudGlmaWVyCiAgLSByZWFkLWNoYW5uZWw6IFtvZmZzZXQsIHNpemVdIGZvciByZWFkaW5nIGZy
b20gdGhlIHNoYXJlZCBtZW1vcnkKICAtIHdyaXRlLWNoYW5uZWw6IFtvZmZzZXQsIHNpemVdIGZv
ciB3cml0aW5nIHRvIHRoZSBzaGFyZWQgbWVtb3J5CiAgLSBpbnRlcnJ1cHRzOiBJbnRlcnJ1cHRz
IHVzZWQgYnkgdGhlIGRldmljZQoKVGhpcyBlbmFibGVzIGtlcm5lbCBkcml2ZXJzIGFuZCB1c2Vy
c3BhY2UgdG9vbHMgdG8gY29ycmVjdGx5Cmluc3RhbnRpYXRlIGFuZCBjb25maWd1cmUgQmFvIElQ
QyBzaGFyZWQgbWVtb3J5IGRldmljZXMgYmFzZWQKb24gdGhlIERUIGRlc2NyaXB0aW9uLCBmYWNp
bGl0YXRpbmcgZWZmaWNpZW50IGNvbW11bmljYXRpb24KYmV0d2VlbiBWTXMuCgpTaWduZWQtb2Zm
LWJ5OiBKb8OjbyBQZWl4b3RvIDxqb2FvcGVpeG90b0Bvc3l4LnRlY2g+Ci0tLQogLi4uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvYmFvL2lwY3NobWVtLnlhbWwgICAgIHwgOTkgKysrKysrKysrKysrKysr
KysrKwogLi4uL2RldmljZXRyZWUvYmluZGluZ3MvdmVuZG9yLXByZWZpeGVzLnlhbWwgIHwgIDIg
KwogMiBmaWxlcyBjaGFuZ2VkLCAxMDEgaW5zZXJ0aW9ucygrKQogY3JlYXRlIG1vZGUgMTAwNjQ0
IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9iYW8vaXBjc2htZW0ueWFtbAoKZGlm
ZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9iYW8vaXBjc2htZW0u
eWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9iYW8vaXBjc2htZW0ueWFt
bApuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwMDAwMDAuLjM5OGFjNjEwYzI5Zgot
LS0gL2Rldi9udWxsCisrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9iYW8v
aXBjc2htZW0ueWFtbApAQCAtMCwwICsxLDk5IEBACisjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVy
OiBHUEwtMi4wLW9ubHkgT1IgQlNELTItQ2xhdXNlCislWUFNTCAxLjIKKy0tLQorJGlkOiAiaHR0
cDovL2RldmljZXRyZWUub3JnL3NjaGVtYXMvYmFvL2lwY3NobWVtLnlhbWwjIgorJHNjaGVtYTog
Imh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9tZXRhLXNjaGVtYXMvY29yZS55YW1sIyIKKwordGl0bGU6
IEJhbyBJUEMgU2hhcmVkIE1lbW9yeSBEZXZpY2UKKworbWFpbnRhaW5lcnM6CisgIC0gSm9zw6kg
TWFydGlucyA8am9zZUBvc3l4LnRlY2g+CisgIC0gRGF2aWQgQ2VyZGVpcmEgPGRhdmlkbWNlcmRl
aXJhQG9zeXgudGVjaD4KKyAgLSBKb8OjbyBQZWl4b3RvIDxqb2FvcGVpeG90b0Bvc3l4LnRlY2g+
CisKK2Rlc2NyaXB0aW9uOiB8CisgIFNoYXJlZCBtZW1vcnkgYmFzZWQgY29tbXVuaWNhdGlvbiBk
ZXZpY2UgZm9yIEJhbyBoeXBlcnZpc29yIGd1ZXN0cy4KKyAgSXQgYWxsb3dzIHRoZSBrZXJuZWwg
dG8gaW50ZXJmYWNlIHdpdGggZ3Vlc3RzIHJ1bm5pbmcgdW5kZXIKKwl0aGUgQmFvIGh5cGVydmlz
b3IsIHByb3ZpZGluZyBhIGNoYXJhY3RlciBkZXZpY2UgaW50ZXJmYWNlCisJZm9yIGV4Y2hhbmdp
bmcgZGF0YSB0aHJvdWdoIGRlZGljYXRlZCBzaGFyZWQtbWVtb3J5IHJlZ2lvbnMuCisKK3Byb3Bl
cnRpZXM6CisgIGNvbXBhdGlibGU6CisgICAgY29uc3Q6ICJiYW8saXBjc2htZW0iCisKKyAgcmVn
OgorICAgIGRlc2NyaXB0aW9uOiB8CisgICAgICBNZW1vcnkgcmVzb3VyY2UgZm9yIHRoZSBzaGFy
ZWQgbWVtb3J5IGRldmljZS4KKyAgICBtYXhJdGVtczogNAorICAgIHR5cGU6IGFycmF5CisgICAg
aXRlbXM6CisgICAgICB0eXBlOiBpbnRlZ2VyCisKKyAgaWQ6CisgICAgZGVzY3JpcHRpb246IERy
aXZlciBpbnN0YW5jZSBJRAorICAgIHR5cGU6IGludGVnZXIKKyAgICBtaW5pbXVtOiAwCisKKyAg
cmVhZC1jaGFubmVsOgorICAgIGRlc2NyaXB0aW9uOiB8CisgICAgICBEZWZpbmVzIHRoZSBzaGFy
ZWQtbWVtb3J5IHJlZ2lvbiB1c2VkIGJ5IHRoZSBndWVzdCDihpIgaG9zdCBkYXRhIHBhdGguCisK
KyAgICAgIFRoZSB2YWx1ZSBpcyBhIDItY2VsbCBhcnJheSBkZXNjcmliaW5nIGEgc3ViLXJlZ2lv
biBpbnNpZGUgdGhlIG1haW4KKyAgICAgIGByZWdgIGFyZWE6CisgICAgICAgIC0gVGhlIGZpcnN0
IGNlbGwgaXMgdGhlIGJ5dGUgb2Zmc2V0IGZyb20gdGhlIGJlZ2lubmluZyBvZiB0aGUKKyAgICAg
ICAgICBzaGFyZWQtbWVtb3J5IHJlZ2lvbiBzcGVjaWZpZWQgaW4gYHJlZ2AuCisgICAgICAgIC0g
VGhlIHNlY29uZCBjZWxsIGlzIHRoZSBzaXplIG9mIHRoZSByZWFkYWJsZSByZWdpb24gaW4gYnl0
ZXMuCisKKyAgICAgIFRoZSBkcml2ZXIgd2lsbCBvbmx5IHJlYWQgZGF0YSBmcm9tIHRoaXMgc3Vi
LXJlZ2lvbi4KKyAgICB0eXBlOiBhcnJheQorICAgIGl0ZW1zOgorICAgICAgdHlwZTogaW50ZWdl
cgorICAgIG1pbkl0ZW1zOiAyCisgICAgbWF4SXRlbXM6IDIKKworICB3cml0ZS1jaGFubmVsOgor
ICAgIGRlc2NyaXB0aW9uOiB8CisgICAgICBEZWZpbmVzIHRoZSBzaGFyZWQtbWVtb3J5IHJlZ2lv
biB1c2VkIGJ5IHRoZSBob3N0IOKGkiBndWVzdCBkYXRhIHBhdGguCisKKyAgICAgIFRoZSB2YWx1
ZSBpcyBhIDItY2VsbCBhcnJheSBkZXNjcmliaW5nIGEgc3ViLXJlZ2lvbiBpbnNpZGUgdGhlIG1h
aW4KKyAgICAgIGByZWdgIGFyZWE6CisgICAgICAgIC0gVGhlIGZpcnN0IGNlbGwgaXMgdGhlIGJ5
dGUgb2Zmc2V0IGZyb20gdGhlIGJlZ2lubmluZyBvZiB0aGUKKyAgICAgICAgICBzaGFyZWQtbWVt
b3J5IHJlZ2lvbiBzcGVjaWZpZWQgaW4gYHJlZ2AuCisgICAgICAgIC0gVGhlIHNlY29uZCBjZWxs
IGlzIHRoZSBzaXplIG9mIHRoZSB3cml0YWJsZSByZWdpb24gaW4gYnl0ZXMuCisKKyAgICAgIFRo
ZSBkcml2ZXIgd2lsbCBvbmx5IHdyaXRlIGRhdGEgaW50byB0aGlzIHN1Yi1yZWdpb24uCisgICAg
dHlwZTogYXJyYXkKKyAgICBpdGVtczoKKyAgICAgIHR5cGU6IGludGVnZXIKKyAgICBtaW5JdGVt
czogMgorICAgIG1heEl0ZW1zOiAyCisKKyAgaW50ZXJydXB0czoKKyAgICBkZXNjcmlwdGlvbjog
fAorICAgICAgSW50ZXJydXB0IHNwZWNpZmljYXRpb24gZm9yIHRoZSBkZXZpY2UuCisgICAgdHlw
ZTogYXJyYXkKKyAgICBpdGVtczoKKyAgICAgIHR5cGU6IGludGVnZXIKKyAgICBtaW5JdGVtczog
MworICAgIG1heEl0ZW1zOiAzCisKK3JlcXVpcmVkOgorICAtIGNvbXBhdGlibGUKKyAgLSByZWcK
KyAgLSBpZAorICAtIHJlYWQtY2hhbm5lbAorICAtIHdyaXRlLWNoYW5uZWwKKyAgLSBpbnRlcnJ1
cHRzCisKK2FkZGl0aW9uYWxQcm9wZXJ0aWVzOiBmYWxzZQorCitleGFtcGxlczoKKyAgLSB8Cisg
ICAgYmFvLWlwY0BmMDAwMDAwMCB7CisgICAgICAgIGNvbXBhdGlibGUgPSAiYmFvLGlwY3NobWVt
IjsKKyAgICAgICAgcmVnID0gPDB4MCAweGYwMDAwMDAwIDB4MCAweDAwMDEwMDAwPjsKKyAgICAg
ICAgcmVhZC1jaGFubmVsID0gPDB4MCAweDIwMDA+OworICAgICAgICB3cml0ZS1jaGFubmVsID0g
PDB4MjAwMCAweDIwMDA+OworICAgICAgICBpbnRlcnJ1cHRzID0gPDAgNTIgMT47CisgICAgICAg
IGlkID0gPDA+OworICAgIH07CmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUv
YmluZGluZ3MvdmVuZG9yLXByZWZpeGVzLnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUv
YmluZGluZ3MvdmVuZG9yLXByZWZpeGVzLnlhbWwKaW5kZXggYzc1OTFiMmFlYzJhLi5jMDQ3ZmJk
NmI5MWEgMTAwNjQ0Ci0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy92ZW5k
b3ItcHJlZml4ZXMueWFtbAorKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
dmVuZG9yLXByZWZpeGVzLnlhbWwKQEAgLTIyMyw2ICsyMjMsOCBAQCBwYXR0ZXJuUHJvcGVydGll
czoKICAgICBkZXNjcmlwdGlvbjogU2hlbnpoZW4gQVpXIFRlY2hub2xvZ3kgQ28uLCBMdGQuCiAg
ICJeYmFpa2FsLC4qIjoKICAgICBkZXNjcmlwdGlvbjogQkFJS0FMIEVMRUNUUk9OSUNTLCBKU0MK
KyAgIl5iYW8sLioiOgorICAgIGRlc2NyaXB0aW9uOiBCYW8gSHlwZXJ2aXNvcgogICAiXmJhbmFu
YXBpLC4qIjoKICAgICBkZXNjcmlwdGlvbjogQklQQUkgS0VKSSBMSU1JVEVECiAgICJeYmVhY29u
LC4qIjoKLS0gCjIuNDMuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtcmlzY3YK
