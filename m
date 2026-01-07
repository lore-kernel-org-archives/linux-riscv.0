Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E49A2CD585A
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Jan 2026 16:29:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ON7IDz+BdhIznXOVfQyVFv8RMEczXjV1kqRrzPEBeww=; b=SnuzUKpJgeMHDA
	r3u9BKPbc9B5GlqI7knU6/jWCd55zd7UklpYO2zKAN/EfpVtkCiFKyXX9OOiDv7/MZ5wVvlBQQxEx
	A14rhRj9ZTDX/aReVd5v5gvOy8yrm3/p7rn1ReveCPHy86s3Y/bpA2Mg7emrn3vAqYhKKyHR+2ePw
	TBRXXKKzjEow02rrAIbyXnRWFaQgELN0QA5PIATUWooRl+miItG+fw+WzQ52bGF9KppybM7cj+Q2X
	/pnbx3MeD/+gGYnx+Fzf5Ty7bVroA6VWRjPdO/Kqha+E/Rx3Y56a3b8CXItZmo4P2mISLutSKomdS
	IVnYKMCvoVRqWxthINxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdWPd-0000000FHm5-1RWW;
	Wed, 07 Jan 2026 16:29:33 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdWPZ-0000000FHkd-1Kif
	for linux-riscv@lists.infradead.org;
	Wed, 07 Jan 2026 16:29:31 +0000
Received: by mail-wr1-x443.google.com with SMTP id ffacd0b85a97d-42fb5810d39so1264719f8f.2
        for <linux-riscv@lists.infradead.org>; Wed, 07 Jan 2026 08:29:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=osyx-tech.20230601.gappssmtp.com; s=20230601; t=1767803366; x=1768408166; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=utTQM12vp3HfC7wPK2LBUo4jmtAYzgNAcmtNUG5Yv4o=;
        b=pDigqQkk2FJ86xB5UtHZnIaeZ3n8huNsyB1spzqU4Tm+7R3EtBe3Bl7mtI9kZBBI+7
         X8c+H1NgPPIf5+GU7242nk7gOQ+EaRG4Bdw49UnwMjeea1yUX5Z/bWy4NRtrTuzw+xUR
         48TV4vehjfKGB9qaP6BtX+MstX/VTATx2ttoCpYjn5+9n52UONq91uMRAQxqsvZolE5u
         F52Cq2yxV8psVQ2xZAvCfjVcoN4f3aT2scvqaR0mjn0BN3KSQat3yNPTzF6T9e8nFBRh
         8erwZhXZwpRRQXm5psE4PVl2o2F+KAfoRuNcbMdO6XMOMZ61rwVXfRwpFnz/Z2lcKL4p
         cwQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767803366; x=1768408166;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=utTQM12vp3HfC7wPK2LBUo4jmtAYzgNAcmtNUG5Yv4o=;
        b=j1bTuEsDnlScRsBai12nF4gXCUlqIwX5WTi0L/Fux9fdYXiV6V50p+Z02q1hrhrtK/
         pVQjMxYQJ/mHSOAqcqmn1dtiCVUdLm99o+9Qku8CHeHHmzqMI4zDPhuZ73v/TN8f6O9I
         BAnO6MB9DMsF6clqJNn3fG+Jmu+xN5pH1UdAdxSrfMXo0LmSH3/EjHB4TDyQVGuxuZsr
         CE1QZAc5rRYZZmwxp4zNxV9p/q0ihwEcGgt6uCTq/8WVrcaLoooYjiIuEKCCrHBO0OTU
         9yj/TLRVGRDfX9U0fr0zkOdQf5fw3ZfahyUpiQV50e/5nZG6w0/5rSbtnPt8JVHRqDUY
         l5zg==
X-Forwarded-Encrypted: i=1; AJvYcCWR3ta52hydBSxfkOypXorfkFyW2D2iL4S2eajqVnjbyu74jtUcXoWX8Px5Qm6iRq1b3b+VQ2h5wp8Wlg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxxg/Ht8g9CX1pLs0Eo3oFM8cbc2jc4caS7bscXoPAH2kSXErOi
	dyStHdcxpNHCMaWtKguhzQVHSzaL/jADuyyQKNhvehcrk4TAs0OApKwfSItP7ok4FajV
X-Gm-Gg: AY/fxX40IU/Xo0dX/ov9SOEfQ4daK12M46tZy+phK4X23y1x0Iy7CdDeukYSjTRBlXz
	IRg/g+4D0UyI2UB1hwl/Z6lIL0szx1BIPpKWJUffDWh48M48em6vqiKu5brq9PhDgwJ1M71/nlg
	8wmM1IwIy37OZSJ3XKnmCClxOvxJKqaBybTVYFh3BGj4kyweBhTSGqgFyH266QLiyO6NPbWwneb
	W0Rn+qWJBNGmERLfxO5V9lCgaED9uhNstyJuGXUx+4wWkqOM4Ydl9wJ2ansimMU1RQ1h8bmGOWG
	U9k4I3g1ldRPCRPr3PDNOzS+vjhqGDWQmBeRmyHy4+K/hrIrljYOgbEuQR434iJI47vAW9QKzdL
	+3i+q+axtyolpq1K1O3Tf8sbbNiS4pIqjslUSUuhJN4RGKKKrcO3tqAAeFLuAhyMLDqCYlVVmMm
	r9Szz0oWaDYtoF2JOgnw==
X-Google-Smtp-Source: AGHT+IEsJtA8N1N6cQme/xrsmcYvUfGO3yfitzXA9dloqZIoULK1bllqhEJTvQbGnSNhB8OYA3C0wg==
X-Received: by 2002:a05:6000:2085:b0:431:104:6dc2 with SMTP id ffacd0b85a97d-432c362811cmr3267285f8f.8.1767803366422;
        Wed, 07 Jan 2026 08:29:26 -0800 (PST)
Received: from jp-linux.Home ([2001:8a0:f59c:a900:4a3c:13be:a1c0:7b9f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd5ff0b2sm11117030f8f.42.2026.01.07.08.29.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 08:29:26 -0800 (PST)
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
Subject: [PATCH v2 0/6] virt: Add Bao hypervisor IPC and I/O dispatcher drivers
Date: Wed,  7 Jan 2026 16:28:23 +0000
Message-ID: <20260107162829.416885-1-joaopeixoto@osyx.tech>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251224135217.25350-1-joaopeixoto@osyx.tech>
References: <20251224135217.25350-1-joaopeixoto@osyx.tech>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260107_082929_582901_6FB8CD03 
X-CRM114-Status: UNSURE (   9.86  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

RnJvbTogSm/Do28gUGVpeG90byA8am9hb3BlaXhvdG9Ab3N5eC50ZWNoPgoKVGhpcyBzZXJpZXMg
aW50cm9kdWNlcyBzdXBwb3J0IGZvciBCYW8gaHlwZXJ2aXNvciBndWVzdC1zaWRlIGRyaXZlcnMK
dW5kZXIgZHJpdmVycy92aXJ0L2JhbywgYWxvbmcgd2l0aCB0aGUgYXNzb2NpYXRlZCBEZXZpY2Ug
VHJlZSBiaW5kaW5ncywKVUFQSSBoZWFkZXJzLCBhbmQgTUFJTlRBSU5FUlMgZW50cmllcy4KCkJh
byBpcyBhIGxpZ2h0d2VpZ2h0IHN0YXRpYy1wYXJ0aXRpb25pbmcgaHlwZXJ2aXNvciBmb3IgZW1i
ZWRkZWQgYW5kCnNhZmV0eS1jcml0aWNhbCBzeXN0ZW1zLiBUaGlzIHNlcmllcyBhZGRzOgotIEJh
byBJUEMgc2hhcmVkIG1lbW9yeSBkcml2ZXI6IEVuYWJsZXMgTGludXggZ3Vlc3RzIHRvIGNvbW11
bmljYXRlCndpdGggZWFjaCBvdGhlciB2aWEgc2hhcmVkIG1lbW9yeSByZWdpb25zLgotIEJhbyBJ
L08gRGlzcGF0Y2hlciBkcml2ZXI6IEFsbG93cyBCYW8gVk1zIHRvIHNoYXJlIEkvTyBkZXZpY2Vz
IHVzaW5nCmRldmljZSBwYXJhdmlydHVhbGl6YXRpb24gKFZpcnRJTykuCgpLZXkgdXBkYXRlcyBp
biB0aGlzIHZlcnNpb24gdG8gYWxpZ24gd2l0aCB1cHN0cmVhbSByZXF1aXJlbWVudHM6CjEuIFN3
aXRjaGVkIHRvIG1pc2MgZGV2aWNlIEFQSTogUmVtb3ZlZCBhbGwgY2RldiwgY2xhc3MsIGFuZAph
bGxvY19jaHJkZXZfcmVnaW9uIGNvZGUgaW4gZmF2b3Igb2YgbWlzY19yZWdpc3RlcigpIGZvciBz
aW1wbGVyLApzdGFuZGFyZCBkZXZpY2UgbWFuYWdlbWVudC4KMi4gQ2xlYW4ga2VybmVsIHN0eWxl
IGFuZCBmb3JtYXR0aW5nOiBBbGwgY29kZSBwYXNzZXMgY2hlY2twYXRjaC5wbCwKd2l0aCBjb25z
aXN0ZW50IHZhcmlhYmxlIGRlY2xhcmF0aW9uLCBmdW5jdGlvbiBuYW1pbmcsIGFuZCBjb21tZW50
IHN0eWxlLgozLiBBcmNoaXRlY3R1cmUgYWJzdHJhY3Rpb246IENvbnNvbGlkYXRlZCBBUk0sIEFS
TTY0LCBhbmQgUklTQy1WIGh5cGVyY2FsbApsb2dpYyBpbnRvIGFyY2hpdGVjdHVyZS1zcGVjaWZp
YyBoZWFkZXJzLCByZW1vdmluZyBpbi1kcml2ZXIgI2lmZGVmcy4KNC4gQ29tbWl0IG1lc3NhZ2Vz
OiBOb3cgY29uY2lzZSBhbmQgTGludXgta2VybmVsLXN0eWxlLCBkZXNjcmliaW5nCmJlaGF2aW9y
IGFuZCBpbXBhY3QgY2xlYXJseS4KNS4gRGV2aWNlIFRyZWUgY29tcGxpYW5jZTogRml4ZWQgYWxs
IG1ha2UgZHRfYmluZGluZ19jaGVjayBlcnJvcnMgdG8KZW5zdXJlIERUIGJpbmRpbmcgY29ycmVj
dG5lc3MuCgpUaGlzIHNlcmllcyBoYXMgYmVlbiB2YWxpZGF0ZWQgb24gTGludXggZ3Vlc3RzIHJ1
bm5pbmcgdW5kZXIgQmFvCmh5cGVydmlzb3IsIGNvbmZpcm1pbmcgY29ycmVjdCBpbml0aWFsaXph
dGlvbiwgSVBDIHNoYXJlZC1tZW1vcnkKcmVhZC93cml0ZSBvcGVyYXRpb25zLCBhbmQgSS9PIERp
c3BhdGNoZXIgZnVuY3Rpb25hbGl0eSBmb3IKYmFja2VuZCBWTXMuCgpGZWVkYmFjayBhbmQgcmV2
aWV3IGZyb20gbWFpbnRhaW5lcnMgb2YgdmlydHVhbGl6YXRpb24sCmFyY2hpdGVjdHVyZS1zcGVj
aWZpYyBjb2RlIChBUk0sIEFSTTY0LCBSSVNDLVYpLCBEZXZpY2UgVHJlZQpiaW5kaW5ncywgYW5k
IFVBUEkgYXJlIHdlbGNvbWUuCgpKb8OjbyBQZWl4b3RvICg2KToKICBkdC1iaW5kaW5nczogQWRk
IEJhbyBJUEMgc2hhcmVkIG1lbW9yeSBkcml2ZXIgYmluZGluZwogIHZpcnQ6IGJhbzogQWRkIEJh
byBJUEMgc2hhcmVkIG1lbW9yeSBkcml2ZXIKICBkdC1iaW5kaW5nczogQWRkIEJhbyBJL08gZGlz
cGF0Y2hlciBkcml2ZXIgYmluZGluZwogIHZpcnQ6IGJhbzogQWRkIEJhbyBJL08gZGlzcGF0Y2hl
ciBkcml2ZXIKICB2aXJ0OiBiYW86IE1vdmUgQkFPX0lQQ1NITUVNX0hZUEVSQ0FMTF9JRCB0byBj
b21tb24gaGVhZGVyCiAgTUFJTlRBSU5FUlM6IEFkZCBlbnRyaWVzIGZvciBCYW8gaHlwZXJ2aXNv
ciBkcml2ZXJzLCBoZWFkZXJzLCBhbmQgRFQKICAgIGJpbmRpbmdzCgogLi4uL2JpbmRpbmdzL2Jh
by9iYW8saW8tZGlzcGF0Y2hlci55YW1sICAgICAgIHwgIDc1ICsrKysKIC4uLi9kZXZpY2V0cmVl
L2JpbmRpbmdzL2Jhby9iYW8saXBjc2htZW0ueWFtbCB8ICA4MiArKysrCiAuLi4vZGV2aWNldHJl
ZS9iaW5kaW5ncy92ZW5kb3ItcHJlZml4ZXMueWFtbCAgfCAgIDIgKwogLi4uL3VzZXJzcGFjZS1h
cGkvaW9jdGwvaW9jdGwtbnVtYmVyLnJzdCAgICAgIHwgICAyICsKIE1BSU5UQUlORVJTICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAxMyArCiBhcmNoL2FybS9pbmNsdWRlL2Fz
bS9iYW8uaCAgICAgICAgICAgICAgICAgICAgfCAgNjAgKysrCiBhcmNoL2FybTY0L2luY2x1ZGUv
YXNtL2Jhby5oICAgICAgICAgICAgICAgICAgfCAgNjAgKysrCiBhcmNoL3Jpc2N2L2luY2x1ZGUv
YXNtL2Jhby5oICAgICAgICAgICAgICAgICAgfCAgNjAgKysrCiBkcml2ZXJzL3ZpcnQvS2NvbmZp
ZyAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgIDIgKwogZHJpdmVycy92aXJ0L01ha2VmaWxl
ICAgICAgICAgICAgICAgICAgICAgICAgIHwgICAyICsKIGRyaXZlcnMvdmlydC9iYW8vS2NvbmZp
ZyAgICAgICAgICAgICAgICAgICAgICB8ICAgNSArCiBkcml2ZXJzL3ZpcnQvYmFvL01ha2VmaWxl
ICAgICAgICAgICAgICAgICAgICAgfCAgIDQgKwogZHJpdmVycy92aXJ0L2Jhby9pby1kaXNwYXRj
aGVyL0tjb25maWcgICAgICAgIHwgIDE1ICsKIGRyaXZlcnMvdmlydC9iYW8vaW8tZGlzcGF0Y2hl
ci9NYWtlZmlsZSAgICAgICB8ICAgNCArCiBkcml2ZXJzL3ZpcnQvYmFvL2lvLWRpc3BhdGNoZXIv
YmFvX2Rydi5oICAgICAgfCAzNjEgKysrKysrKysrKysrKysrKwogZHJpdmVycy92aXJ0L2Jhby9p
by1kaXNwYXRjaGVyL2RtLmMgICAgICAgICAgIHwgNDA1ICsrKysrKysrKysrKysrKysrKwogZHJp
dmVycy92aXJ0L2Jhby9pby1kaXNwYXRjaGVyL2RyaXZlci5jICAgICAgIHwgMTg1ICsrKysrKysr
CiBkcml2ZXJzL3ZpcnQvYmFvL2lvLWRpc3BhdGNoZXIvaW50Yy5jICAgICAgICAgfCAgNjQgKysr
CiBkcml2ZXJzL3ZpcnQvYmFvL2lvLWRpc3BhdGNoZXIvaW9fY2xpZW50LmMgICAgfCA0MDUgKysr
KysrKysrKysrKysrKysrCiAuLi4vdmlydC9iYW8vaW8tZGlzcGF0Y2hlci9pb19kaXNwYXRjaGVy
LmMgICAgfCAxNzkgKysrKysrKysKIGRyaXZlcnMvdmlydC9iYW8vaW8tZGlzcGF0Y2hlci9pb2V2
ZW50ZmQuYyAgICB8IDMyMyArKysrKysrKysrKysrKwogZHJpdmVycy92aXJ0L2Jhby9pby1kaXNw
YXRjaGVyL2lycWZkLmMgICAgICAgIHwgMzE0ICsrKysrKysrKysrKysrCiBkcml2ZXJzL3ZpcnQv
YmFvL2lwY3NobWVtL0tjb25maWcgICAgICAgICAgICAgfCAgIDggKwogZHJpdmVycy92aXJ0L2Jh
by9pcGNzaG1lbS9NYWtlZmlsZSAgICAgICAgICAgIHwgICAzICsKIGRyaXZlcnMvdmlydC9iYW8v
aXBjc2htZW0vaXBjc2htZW0uYyAgICAgICAgICB8IDI1MiArKysrKysrKysrKwogaW5jbHVkZS9s
aW51eC9iYW8uaCAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDQ0ICsrCiBpbmNsdWRlL3Vh
cGkvbGludXgvYmFvLmggICAgICAgICAgICAgICAgICAgICAgfCAgOTggKysrKysKIDI3IGZpbGVz
IGNoYW5nZWQsIDMwMjcgaW5zZXJ0aW9ucygrKQogY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9iYW8vYmFvLGlvLWRpc3BhdGNoZXIueWFtbAogY3Jl
YXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9iYW8vYmFv
LGlwY3NobWVtLnlhbWwKIGNyZWF0ZSBtb2RlIDEwMDY0NCBhcmNoL2FybS9pbmNsdWRlL2FzbS9i
YW8uaAogY3JlYXRlIG1vZGUgMTAwNjQ0IGFyY2gvYXJtNjQvaW5jbHVkZS9hc20vYmFvLmgKIGNy
ZWF0ZSBtb2RlIDEwMDY0NCBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2Jhby5oCiBjcmVhdGUgbW9k
ZSAxMDA2NDQgZHJpdmVycy92aXJ0L2Jhby9LY29uZmlnCiBjcmVhdGUgbW9kZSAxMDA2NDQgZHJp
dmVycy92aXJ0L2Jhby9NYWtlZmlsZQogY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvdmlydC9i
YW8vaW8tZGlzcGF0Y2hlci9LY29uZmlnCiBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy92aXJ0
L2Jhby9pby1kaXNwYXRjaGVyL01ha2VmaWxlCiBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy92
aXJ0L2Jhby9pby1kaXNwYXRjaGVyL2Jhb19kcnYuaAogY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZl
cnMvdmlydC9iYW8vaW8tZGlzcGF0Y2hlci9kbS5jCiBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVy
cy92aXJ0L2Jhby9pby1kaXNwYXRjaGVyL2RyaXZlci5jCiBjcmVhdGUgbW9kZSAxMDA2NDQgZHJp
dmVycy92aXJ0L2Jhby9pby1kaXNwYXRjaGVyL2ludGMuYwogY3JlYXRlIG1vZGUgMTAwNjQ0IGRy
aXZlcnMvdmlydC9iYW8vaW8tZGlzcGF0Y2hlci9pb19jbGllbnQuYwogY3JlYXRlIG1vZGUgMTAw
NjQ0IGRyaXZlcnMvdmlydC9iYW8vaW8tZGlzcGF0Y2hlci9pb19kaXNwYXRjaGVyLmMKIGNyZWF0
ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL3ZpcnQvYmFvL2lvLWRpc3BhdGNoZXIvaW9ldmVudGZkLmMK
IGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL3ZpcnQvYmFvL2lvLWRpc3BhdGNoZXIvaXJxZmQu
YwogY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvdmlydC9iYW8vaXBjc2htZW0vS2NvbmZpZwog
Y3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvdmlydC9iYW8vaXBjc2htZW0vTWFrZWZpbGUKIGNy
ZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL3ZpcnQvYmFvL2lwY3NobWVtL2lwY3NobWVtLmMKIGNy
ZWF0ZSBtb2RlIDEwMDY0NCBpbmNsdWRlL2xpbnV4L2Jhby5oCiBjcmVhdGUgbW9kZSAxMDA2NDQg
aW5jbHVkZS91YXBpL2xpbnV4L2Jhby5oCgotLSAKMi40My4wCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cmxp
bnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
