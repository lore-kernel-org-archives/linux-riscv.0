Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97B10CCA470
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Oct 2025 11:15:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=OiYLUlUZOHSOBbCAG/RhW82opk6Izpf2G7qKZEZedEA=; b=a+Jqqh7NNR3pu2
	tARBdsuelYYIb1tCoS38tPtuZKjikqdCRQmiFGwDhSnAn569SPorPKlpeojgda3mJTFJjqm2gKmm9
	d1w5QkqFqNeXTPV1ONsMnw6TVRHnBY0+17Q4pnRE6aduCKaTNPz1HP8cQIFY7BK3zWhH1wia4DN8r
	vIMVy0DCrYufyd7Cc8gNSyrPIwncgW0NykuMmXywJb7N8GFS/J6HYIYjvBLHa4uRAGwTDmGXfmxYZ
	0b1sR7bhXXWH08WZJYjNXNshZtpR9maDAk6v1ETbJq3xbdkEOAzrw6KvAXaWNv5Vid+DTcXGxMgho
	uDN3rPloD17hSq/SAuUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3unX-00000007M5U-37kT;
	Wed, 01 Oct 2025 11:15:03 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3unU-00000007M4W-30IK
	for linux-riscv@lists.infradead.org;
	Wed, 01 Oct 2025 11:15:02 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-27eceb38eb1so84325965ad.3
        for <linux-riscv@lists.infradead.org>; Wed, 01 Oct 2025 04:15:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1759317300; x=1759922100; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=z1+2fSaFB9F3RSpAxYACKIZ12RlpjvIv2ZQovdB0QZc=;
        b=T46keLDtm+BMUWICJ0qiE2FcHkpDuljSfKZeYk6ks90IWPAijsDJyGJQV4I6o79sZ3
         aRABBGQ0SpcNpEpWn4CDlqmc/hxSAayFyKXezrxv7jqkEcSL54McrG64nUSQa1PhILA2
         S5ZujB54C+5ZsDGY1qxtp+dp+WO6SC2OXdklKMQ46VVglCigc1Q+rs2McSVSpZQpPlRY
         xtCBfkpG+qBfYhPqPCWGmE11Rt6YrTTjRTnCYQGQ+YobAx0swsxYin5QVTyyeapwY9i+
         VvK7T6GsJcjnlDlKPlxG2uoWXLXgBoG6bzXHOnSCXvjcfQZ/ALGs9BNPFMXQsPoY6ti8
         ydCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759317300; x=1759922100;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z1+2fSaFB9F3RSpAxYACKIZ12RlpjvIv2ZQovdB0QZc=;
        b=ubrfhCZKI1qHteJRxNSYd+1pFCtuRuSRhcqsIYp1Ubc4/1p+l9t8EgCu3OBZNJm3c7
         FpXMPH0OuBTNxTXgeY+ENRPn2URiYgt8cCAp9EYEbvdcpzqfjWRjckwvHgThZnYj0LMp
         TNCe1pFq8k/GDDznArt7fGVTqZZAWiJyqX20EzvpEj4uz5onsJO1c9OBTIwpR5x0U+q1
         OUwY/EdXFCPnVyG7Q3yM+1wPmrfdpkXg6b1s2p65ZQ9TvPnDKs7zBUc7i1cDF+cTSIpN
         KOLu1WMLKA8ugGzSIcG/DPhWzgOh5XwWgRocPp6hByyeJsOp5MoInI191FwE3zQFac3v
         XtQg==
X-Forwarded-Encrypted: i=1; AJvYcCVasNPgdyxPRpmTJr59e+OdyuZcMzq5/FlX4Ad7E4LLFLX30ukOuXiWKsMrNVw7k87a+UaiChYnjGtrhg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx+36PV2AIIfNaHKOHcKbQTopBNvqfjy2vxwY2E+LUCsqXFx3VD
	3u8Y7Vf/vEVXXPtjM8P1ZTLW2zLYdFQYQMKKf7f11MerE5iU+kjbVx4jkWU8YHlA79M=
X-Gm-Gg: ASbGnctPqAsciPKfrnrvJh9E8eO/aBMlpoIgAjjYhoviwFMaunZuf4EvSxNeuvSw5J1
	rdPkLRFq2A/0cRb1a5hUNsbq7HDapIRYapKg7X3PBCjAH10ErL6ZqLTitu7AgMTG1zfqPf+Rtxx
	4RrcigZkIu0/O7i0KD+SMvR9ByugfwNulbhtZ8nOfQ2ME7042t8TpYWNhG+v0dHpSP1eU5GVAgE
	GaN1AVtlOuZdRbMyNRjB1v4Dp65oK9haO8ULbWCszIRKfMAMxaOYugUDVCWqVNPHKQPddM8dyRr
	5AAOmRBsOYbACuVM5dB2lg5Dp5masVDC38IDN7+JF0IcqhzzFeiDKMvmCoFnGpNjEwW4JBt60OQ
	KA9FW2I4FDR52FVcThGnAvI3nC1hTS9M+1oOHiaW6yuz81uzmmYw/zy0STcrXoelk7tAB9WQTPQ
	Tb
X-Google-Smtp-Source: AGHT+IFKORUJMM66qEClhRMugGzGpIYW8rORBanMylDpKjSnLar+t2zXK3ZVyvAq3H4MPmvctX3m/w==
X-Received: by 2002:a17:903:1b46:b0:27a:6c30:49c with SMTP id d9443c01a7336-28e7f2b59c1mr39193525ad.27.1759317299709;
        Wed, 01 Oct 2025 04:14:59 -0700 (PDT)
Received: from hsinchu26.internal.sifive.com ([210.176.154.34])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-27eeb9a8ebfsm155163455ad.67.2025.10.01.04.14.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Oct 2025 04:14:59 -0700 (PDT)
From: Yong-Xuan Wang <yongxuan.wang@sifive.com>
To: linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Cc: greentime.hu@sifive.com,
	vincent.chen@sifive.com,
	andybnac@gmail.com,
	Yong-Xuan Wang <yongxuan.wang@sifive.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Subject: [PATCH v 0/2] Optimize the allocation of vector regset
Date: Wed,  1 Oct 2025 19:14:25 +0800
Message-ID: <20251001111451.299163-1-yongxuan.wang@sifive.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251001_041500_952145_A0393777 
X-CRM114-Status: GOOD (  11.59  )
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

VGhlIHZlY3RvciByZWdzZXQgdXNlcyB0aGUgbWF4aW11bSBwb3NzaWJsZSB2bGVuYiA4MTkyIHRv
IGFsbG9jYXRlIGEKMl4xOCBieXRlcyBidWZmZXIgdG8gY29weSB0aGUgdmVjdG9yIHJlZ2lzdGVy
LiBCdXQgbW9zdCBwbGF0Zm9ybXMKZG9u4oCZdCBzdXBwb3J0IHRoZSBsYXJnZXN0IHZsZW5iLgoK
VGhlIHJlZ3NldCBoYXMgMiB1c2VycywgcHRyYWNlIHN5c2NhbGwgYW5kIGNvcmVkdW1wLiBXaGVu
IGhhbmRsaW5nIHRoZQpQVFJBQ0VfR0VUUkVHU0VUIHJlcXVlc3RzIGZyb20gcHRyYWNlIHN5c2Nh
bGwsIExpbnV4IHdpbGwgcHJlcGFyZSBhCmtlcm5lbCBidWZmZXIgd2hpY2ggc2l6ZSBpcyBtaW4o
dXNlciBidWZmZXIgc2l6ZSwgbGltaXQpLiBBIG1hbGljaW91cwp1c2VyIHByb2Nlc3MgbWlnaHQg
b3ZlcndoZWxtIGEgbWVtb3J5LWNvbnN0cmFpbnRlZCBzeXN0ZW0gd2hlbiB0aGUKYnVmZmVyIGxp
bWl0IGlzIHZlcnkgbGFyZ2UuIFRoZSBjb3JlZHVtcCB1c2VzIHJlZ3NldF9nZXRfYWxsb2MoKSB0
bwpnZXQgdGhlIGNvbnRleHQgb2YgdmVjdG9yIHJlZ2lzdGVyLiBCdXQgdGhpcyBBUEkgYWxsb2Nh
dGVzIGJ1ZmZlcgpiZWZvcmUgY2hlY2tpbmcgd2hldGhlciB0aGUgdGFyZ2V0IHByb2Nlc3MgdXNl
cyB2ZWN0b3IgZXh0ZW5zaW9uLCB0aGlzCndhc3RlcyB0aW1lIHRvIHByZXBhcmUgYSBsYXJnZSBt
ZW1vcnkgYnVmZmVyLiAKClRoZSBidWZmZXIgbGltaXQgY2FuIGJlIGRldGVybWluZWQgYWZ0ZXIg
Z2V0dGluZyBwbGF0Zm9ybSB2bGVuYiBpbiB0aGUKZWFybHkgYm9vdCBzdGFnZSwgdGhpcyBjYW4g
bGV0IHRoZSByZWdzZXQgYnVmZmVyIG1hdGNoIHJlYWwgaGFyZHdhcmUKbGltaXRzLiBBbHNvIGFk
ZCAuYWN0aXZlIGNhbGxiYWNrcyB0byBsZXQgdGhlIGNvcmVkdW1wIHNraXAgdmVjdG9yIHBhcnQK
d2hlbiB0YXJnZXQgcHJvY2VzcyBkb2Vzbid0IHVzZSBpdC4KCkFmdGVyIHRoaXMgcGF0Y2hzZXQs
IHVzZXJzcGFjZSBwcm9jZXNzIG5lZWRzIDIgcHRyYWNlIHN5c2NhbGxzIHRvCnJldHJpZXZlIHRo
ZSB2ZWN0b3IgcmVnc2V0IHdpdGggUFRSQUNFX0dFVFJFR1NFVC4gVGhlIGZpcnN0IHB0cmFjZSBj
YWxsCm9ubHkgcmVhZHMgdGhlIGhlYWRlciB0byBnZXQgdGhlIHZsZW5iIGluZm9ybWF0aW9uLiBU
aGVuIHByZXBhcmUgYQpzdWl0YWJsZSBidWZmZXIgdG8gZ2V0IHRoZSByZWdpc3RlciBjb250ZXh0
LiBUaGUgbmV3IHZlY3RvciBwdHJhY2UKa3NlbGZ0ZXN0IGRlbW9uc3RyYXRlcyBpdC4KCllvbmct
WHVhbiBXYW5nICgyKToKICByaXNjdjogcHRyYWNlOiBPcHRpbWl6ZSB0aGUgYWxsb2NhdGlvbiBv
ZiB2ZWN0b3IgcmVnc2V0CiAgc2VsZnRlc3RzOiByaXNjdjogQWRkIHRlc3QgZm9yIHRoZSBWZWN0
b3IgcHRyYWNlIGludGVyZmFjZQoKIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vdmVjdG9yLmggICAg
ICAgICAgICAgICB8ICAgMSArCiBhcmNoL3Jpc2N2L2tlcm5lbC9wdHJhY2UuYyAgICAgICAgICAg
ICAgICAgICAgfCAgMjQgKysrLQogYXJjaC9yaXNjdi9rZXJuZWwvdmVjdG9yLmMgICAgICAgICAg
ICAgICAgICAgIHwgICAyICsKIHRvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL3Jpc2N2L3ZlY3Rvci9N
YWtlZmlsZSB8ICAgNSArLQogLi4uL3NlbGZ0ZXN0cy9yaXNjdi92ZWN0b3IvdnN0YXRlX3B0cmFj
ZS5jICAgIHwgMTMyICsrKysrKysrKysrKysrKysrKwogNSBmaWxlcyBjaGFuZ2VkLCAxNjAgaW5z
ZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKIGNyZWF0ZSBtb2RlIDEwMDY0NCB0b29scy90ZXN0
aW5nL3NlbGZ0ZXN0cy9yaXNjdi92ZWN0b3IvdnN0YXRlX3B0cmFjZS5jCgotLSAKMi40My4wCgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlz
Y3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
