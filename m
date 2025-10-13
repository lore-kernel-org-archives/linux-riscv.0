Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 247EBCCA476
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Oct 2025 09:13:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Vq1rIGSbNnWK4WRLxNCIOBFdPAhtiP0Kd9mh/TW7YzE=; b=Yr7Db+Gts5pVDO
	RZCymEtZqyq9nQE2eKhwJwB2ogjx6DFqIMRgSCviEfTbiAJ5yGL37vYYgKANT39u3OtNxfcWGiKQ3
	evz0I9ZV74retvcyiJs0PZv/NwxvVTmVlJh685LtuvDVmV2K9GdrVcIow6ZpN6iJZeTC6EZfyUM7Q
	DMB96zVbETGTiXuMHIz1yFfYqI1lP0Zz9Z92qBANZgGzl60O6dILAGIz3ewoohWlAgml4P+pLKxHx
	vZBYfHr25D0LmqE9QrIFjED4fUK3IFyCQnRo5ZMAhdNGj2sbNex+bR8Zyf95YJXzBAODuuYcpAVv7
	nCkt4M2QSyWS8hYAGgVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8EcQ-0000000ChJH-3YhK;
	Mon, 13 Oct 2025 09:13:26 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8EcP-0000000ChIn-0TqX
	for linux-riscv@lists.infradead.org;
	Mon, 13 Oct 2025 09:13:26 +0000
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-3324523dfb2so3882065a91.0
        for <linux-riscv@lists.infradead.org>; Mon, 13 Oct 2025 02:13:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1760346804; x=1760951604; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=puEhtlhHdjNZJq9B7H+sgmW+MNQKHkmLHApkYcMFYqw=;
        b=htdn4rU6QgeUxiZMUdQKext/Zv+3Z7pKVc//D/GelBR5u7StrFibJuY/sJSGcgk5uc
         9MNPlWOFJZWBMjmQlQG6lmjkEsApsMFtx6eJmoawkcaYfIN8BKSGxDlatQcnIiavomLT
         kijzP/BH+b+4Ogy3zRmytyGpsebah/uw4aZDIMF+JXdTp5arbmhDAvkgGIFIfAbaV55u
         w38ldKHl5vGYQC8ZyMCHJTPc9RCQ3yy6fG/Dxs/KsC4r+qlm6+fZMqNKssvbkVIvGgO4
         PR5StwHiy6vU4yhQHu8GiRDtDPUEjQeNsIa1u3Ogh0ABwanz08Pn2NNuVR4nWcfjV/tJ
         E/6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760346804; x=1760951604;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=puEhtlhHdjNZJq9B7H+sgmW+MNQKHkmLHApkYcMFYqw=;
        b=PNE9E2STDEipX7egZ2G1ZhBQy0xuWMzCA3MqmfeCO+vT+w7tVkf6gQ2e5FdBhDjQop
         6+YPxKvBMOeyCnqFmwWwr6osxtyGz/+FUA0RLpGdbRbn6WquJYKGavi1LU4oLkShXSd8
         RwQlvNKIa6LMtH0N9NVyLRqjH6cK3Llzd6h7nZX96dohdYFcQAoYUnlFpNEG1ZPocBbM
         gsrytjV65Lzzmw6kjrtX7Qd4Y4SKEFz4fL+x7AXnhw7t6IYqwmb6ZhUs6eCH/+ovxI8Z
         MfqlsQoqnqkZMslPGH36WQDk/dt5zTSz1uc8SiUDM8D4Cb3T6lcpeg6Zgwa2i+Fl0gXb
         Qb6Q==
X-Forwarded-Encrypted: i=1; AJvYcCVqQHx02tOCARFfUeFdyHNQuOOVv0TTqMyn67rBg3SS93SSqO0E1IXaTT084vfmNi2krtyUVCYUB8F/6g==@lists.infradead.org
X-Gm-Message-State: AOJu0YyxYp7lQRmHzEO4ORxYQM80lGiwq9mrJYst9dDxagvEpmSvRM2U
	8NJ3tm2i6rN0SPxS+oWYMegLBP+IruVQr7+BdVYGu9Ywg5LEaraLpg/AMcC38ZsOt4cRFOrgWm1
	OUJnz
X-Gm-Gg: ASbGncsyJFdx5tb4ZhYRSB64fPPozAZUUKF8FzzHCtSfLyyCCjdq3QXukEgnR9jdMs8
	cF8SopQB31YOGuck9m5s65HkXyvFhb0xOS+pC5DGYNkmTm90H1z0dRcZnfJidrN+6Sq4BfJWyI1
	SDRFcu3qTAcgY754VLUuaBO0UH5fcmnxtSk+Wb+YUd2a+g/hg3c7UK0bmDN4OOhriLmlntfXimK
	L3BWk68FBUby+Y9GIkc5NsiFSaCdl9btx+E5QpnFjhEPIF+Zip4wEcX3GXUkblko5l0s/BQfLZN
	UnYJ1h96zgNbXKzQoKiy/Uw0F4lVk4K059lVhtx4V3AJXCPHgzruGQA1pCbsZFWh6RyQGiWDX1Q
	yRT2Ha4WVQI2vdHNb4OPYO/GL0rn6h/YyMJeP+jMCVPT0fKwQN3U7xtV18qHCDd4SaHvg5l0=
X-Google-Smtp-Source: AGHT+IEoj7YdDMoreA1spQJTu0BCnH14OzuerL3I7BC4yPUexYDFbRuPl/Tikz8AnuBBaxg3bqJ7SQ==
X-Received: by 2002:a17:90b:3b90:b0:32e:3830:65e1 with SMTP id 98e67ed59e1d1-33b513be284mr29173869a91.33.1760346803844;
        Mon, 13 Oct 2025 02:13:23 -0700 (PDT)
Received: from hsinchu26.internal.sifive.com ([210.176.154.34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33b61a3cc0dsm11727220a91.9.2025.10.13.02.13.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 02:13:23 -0700 (PDT)
From: Yong-Xuan Wang <yongxuan.wang@sifive.com>
To: linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kselftest@vger.kernel.org
Cc: greentime.hu@sifive.com,
	vincent.chen@sifive.com,
	andybnac@gmail.com,
	Yong-Xuan Wang <yongxuan.wang@sifive.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Subject: [PATCH v2 0/2] Optimize the allocation of vector regset
Date: Mon, 13 Oct 2025 17:12:30 +0800
Message-ID: <20251013091318.467864-1-yongxuan.wang@sifive.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251013_021325_337178_8795D005 
X-CRM114-Status: GOOD (  11.65  )
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
ZW1vcnkgYnVmZmVyLgoKVGhlIGJ1ZmZlciBsaW1pdCBjYW4gYmUgZGV0ZXJtaW5lZCBhZnRlciBn
ZXR0aW5nIHBsYXRmb3JtIHZsZW5iIGluIHRoZQplYXJseSBib290IHN0YWdlLCB0aGlzIGNhbiBs
ZXQgdGhlIHJlZ3NldCBidWZmZXIgbWF0Y2ggcmVhbCBoYXJkd2FyZQpsaW1pdHMuIEFsc28gYWRk
IC5hY3RpdmUgY2FsbGJhY2tzIHRvIGxldCB0aGUgY29yZWR1bXAgc2tpcCB2ZWN0b3IgcGFydAp3
aGVuIHRhcmdldCBwcm9jZXNzIGRvZXNuJ3QgdXNlIGl0LgoKQWZ0ZXIgdGhpcyBwYXRjaHNldCwg
dXNlcnNwYWNlIHByb2Nlc3MgbmVlZHMgMiBwdHJhY2Ugc3lzY2FsbHMgdG8KcmV0cmlldmUgdGhl
IHZlY3RvciByZWdzZXQgd2l0aCBQVFJBQ0VfR0VUUkVHU0VULiBUaGUgZmlyc3QgcHRyYWNlIGNh
bGwKb25seSByZWFkcyB0aGUgaGVhZGVyIHRvIGdldCB0aGUgdmxlbmIgaW5mb3JtYXRpb24uIFRo
ZW4gcHJlcGFyZSBhCnN1aXRhYmxlIGJ1ZmZlciB0byBnZXQgdGhlIHJlZ2lzdGVyIGNvbnRleHQu
IFRoZSBuZXcgdmVjdG9yIHB0cmFjZQprc2VsZnRlc3QgZGVtb25zdHJhdGVzIGl0LgoKLS0tCnYy
OgotIGZpeCBpc3N1ZXMgaW4gdmVjdG9yIHB0cmFjZSBrc2VsZnRlc3QgKEFuZHkpCgpZb25nLVh1
YW4gV2FuZyAoMik6CiAgcmlzY3Y6IHB0cmFjZTogT3B0aW1pemUgdGhlIGFsbG9jYXRpb24gb2Yg
dmVjdG9yIHJlZ3NldAogIHNlbGZ0ZXN0czogcmlzY3Y6IEFkZCB0ZXN0IGZvciB0aGUgVmVjdG9y
IHB0cmFjZSBpbnRlcmZhY2UKCiBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3ZlY3Rvci5oICAgICAg
ICAgICAgICAgfCAgIDEgKwogYXJjaC9yaXNjdi9rZXJuZWwvcHRyYWNlLmMgICAgICAgICAgICAg
ICAgICAgIHwgIDI0ICsrKy0KIGFyY2gvcmlzY3Yva2VybmVsL3ZlY3Rvci5jICAgICAgICAgICAg
ICAgICAgICB8ICAgMiArCiB0b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9yaXNjdi92ZWN0b3IvTWFr
ZWZpbGUgfCAgIDUgKy0KIC4uLi9zZWxmdGVzdHMvcmlzY3YvdmVjdG9yL3ZzdGF0ZV9wdHJhY2Uu
YyAgICB8IDEzNCArKysrKysrKysrKysrKysrKysKIDUgZmlsZXMgY2hhbmdlZCwgMTYyIGluc2Vy
dGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCiBjcmVhdGUgbW9kZSAxMDA2NDQgdG9vbHMvdGVzdGlu
Zy9zZWxmdGVzdHMvcmlzY3YvdmVjdG9yL3ZzdGF0ZV9wdHJhY2UuYwoKLS0gCjIuNDMuMAoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2
IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
