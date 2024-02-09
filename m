Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78FBBC4829E
	for <linux-riscv@archiver.kernel.org>; Fri,  9 Feb 2024 06:41:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=4DuCCPUK0lUGWmmkROtsGyacNJKm7UlDSD+ckPfh/zg=; b=y9WWV0ZtIxiFV2
	9ScdEbkU9ZzSDydLTg7JCiuyp93T2Kz2Rt3o1r0gMyOdpvUhM6ZkO5odu/Kp0Bcb1D8ksAUqJQsvX
	OgKZsHKZHpZ4R7r5oVKC0u1bdTTxf+tqxUfIFoFeqgvdzFN2MoPbxcJbqeiIBnMADYj2cigSiqg7n
	UoM6ahQlErC81yLGyByiuAQVtbFHn/ni91sZbnaDRrOsOssTf1Gl4IVYoidx8iRpEIxH8ACQpcABf
	+dIeaVyGfu83JbvlQXY84rzrOezd6UaW5u8uaJHPJMmnVC6yzi0iUV23FhT8wjJ7vWopM2MCxDrGl
	9FbteVjbxiCOmomQ4+rQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rYKZI-0000000GFiO-4BI3;
	Fri, 09 Feb 2024 06:41:01 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rYKZG-0000000GFh3-11Xx
	for linux-riscv@lists.infradead.org;
	Fri, 09 Feb 2024 06:40:59 +0000
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-55fe4534e9bso823382a12.0
        for <linux-riscv@lists.infradead.org>; Thu, 08 Feb 2024 22:40:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vrull.eu; s=google; t=1707460855; x=1708065655; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kvtDAF5lfbY4yUhZUUJ7CosOcOxm/24HARcc6AfCtK4=;
        b=XsPpmp+5bq8RdbcijrXUb5dYqcQAjoMW5n0eFbLXCVCpj6RMFVElo6oebsFcnKKXne
         waIMIQfWY7s7vRg/rfH7vzCjrUfbkfkJmM77fK206ItU3mEPARHUNgn6e4qx8dThzzwA
         ioSpx3qskpC+8l+mKSd1NshGCKkl2s5/ulJO9BqGNs5sN4EF72RBH4xBFqDMlxOMF8it
         9F+ou7+vbBcHokJ512qDaW2v9aJx027/F9MdrBdS+XvA+TULcXUDvrZdK8/VTMRbNtda
         spH1/VM7Oi0eXPxBH4mFCkwcHodMrbwHZEtWhrjJ9A9TP1MBcGzfCs3IoIu57FqwERLE
         2Mzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707460855; x=1708065655;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kvtDAF5lfbY4yUhZUUJ7CosOcOxm/24HARcc6AfCtK4=;
        b=W0bWOHICFTvktw/sH90JBTnUitkyKAt6A3/iQci1LGnR6lsNtvj4F1E9KSvN1nr7dH
         xdWj7Kb0HS3Jp7ciTCEa3DdUB8M+DDJQEI5l9u+MFX5XHCNi1ygSMDNLpH/2gHrWwhhr
         5btYzb1/weECJqnigvBn0Hr7ktiAQaReRGMeeQ+/nr1YP5jdpuqFctVJ2I93rHUesXdb
         k5GObXjnKfDONHArktpw2KKg5jWIWClINwibXKWADAKMAgaiIdrDB4cbMSiqAi828Mtp
         OpO3HN6gp9YvwNoHwfKKOD4ahLU/DwHEFr4A1stRy6fipmB+jg+D0lnPOVNERC/inhaN
         /L0w==
X-Gm-Message-State: AOJu0YyFHkkoqIC5YrN3Ac608ghC415IG45wuAnIdCpw7OvKL48iOUk9
	2oVfW+biMG6ZFb/AWEnUo6K2h3+PFeC0wRmV905rXXXg0AMOrBv+1aSzCYstdj3GxXAwYscKj30
	9+f4=
X-Google-Smtp-Source: AGHT+IHpIKkOgxjK+OQ+Z52aahdSsMDEuAEAMDQo+EQ8mKVlTca/L55YC6piRGYTQoHdHcL4KlFQuA==
X-Received: by 2002:a17:907:7673:b0:a3b:f72d:9c2a with SMTP id kk19-20020a170907767300b00a3bf72d9c2amr190059ejc.62.1707460854816;
        Thu, 08 Feb 2024 22:40:54 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWAlu54lRX16jytgJW8roJL2H0QKMI9bHlcj3TnXGSlYBIoBk1ttjdrTZzNzmVirHFnXFID3upTy4H1ASA/tzipHETgZkmgNtT+1sIwmU0GhKj3EYBRncTJaqvOv7y+mqhZEKbuQbD5nVdE67KR3Vie9bp57bSJ0X/SfGEHPifA05xGWJ5yNomEWstB8tmS7GLuOG2OKK1emxDCGGDQILzS5/CoaVrwlvN5S0JIzHLCqSqFInP5MruknJDOMS9QBs5gvY1r9lp4a859m45AERXSfEKyEAr4GfeWJYc47vGbCOZ2QDeL/6I4cycDMcAl5vG7BID+v8/SxhulWhKkd3XIVvrTO9d1GKsCl6l+2uByZ1/IgXiJQ4iQwA0Qzodf53LBcoPOv99eWt/9zg8TjkDXy/GyYY3WSVgEbhjm5/o8MVTmxzr8vmfHaLOF9dYK6uqsahEbm4xyi2IWAVfs5eTpYHA6+lJOYXQpak9GUsfyWOp1z2cvJP/0MYJkWii8qqNUkdL8nJOlA8dOVvAjrgveq9g463WU+mKshPGavZylY+KSSLvr1zr0hkxpdcnYMRsV/VPkvLKBJylM1JWpUq7IHO+PeNGJC1OC9lCWA2Xrn8Qp+d0uXNdiebytIebrZVauV3FGf/oD/dQ9cNHb5LmPViq2yncp2V5fvI98v4ySLt2bcglj4dyHs2Ch2Z1YuGhTqcSSanM0d41wzHCHZZRvj1BpzO/LNtgMpWu6HOjLwTztDQ2Kk2tzDwtpi2jlaLFxH/w+mOMZzU1uHKzlAKbZbJd9hST1aqKBG/MooIXznVMGfUueWTBogXnPkAD/qQ4ZQMwzTDr27AVyQdRx7d7Wi0c6FvJowfnExEtugC6H9g==
Received: from beast.fritz.box (62-178-148-172.cable.dynamic.surfer.at. [62.178.148.172])
        by smtp.gmail.com with ESMTPSA id vb9-20020a170907d04900b00a370a76d3a0sm441180ejc.123.2024.02.08.22.40.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Feb 2024 22:40:54 -0800 (PST)
From: =?UTF-8?q?Christoph=20M=C3=BCllner?= <christoph.muellner@vrull.eu>
To: linux-riscv@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Jonas Oberhauser <jonas.oberhauser@huaweicloud.com>,
	Peter Zijlstra <peterz@infradead.org>,
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
	Will Deacon <will@kernel.org>,
	Daniel Lustig <dlustig@nvidia.com>,
	Brendan Sweeney <turtwig@utexas.edu>,
	Andrew Waterman <andrew@sifive.com>,
	Brendan Sweeney <brs@berkeley.edu>,
	Andrea Parri <parri.andrea@gmail.com>,
	Hans Boehm <hboehm@google.com>
Cc: =?UTF-8?q?Christoph=20M=C3=BCllner?= <christoph.muellner@vrull.eu>
Subject: [RFC PATCH v2 0/6] RISC-V: Add dynamic TSO support
Date: Fri,  9 Feb 2024 07:40:44 +0100
Message-ID: <20240209064050.2746540-1-christoph.muellner@vrull.eu>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240208_224058_309819_6CDF47EA 
X-CRM114-Status: GOOD (  15.94  )
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

VGhlIHVwY29taW5nIFJJU0MtViBTc2R0c28gc3BlY2lmaWNhdGlvbiBpbnRyb2R1Y2VzIGEgYml0
IGluIHRoZSBzZW52Y2ZnCkNTUiB0byBzd2l0Y2ggdGhlIG1lbW9yeSBjb25zaXN0ZW5jeSBtb2Rl
bCBvZiB1c2VyIG1vZGUgYXQgcnVuLXRpbWUgZnJvbQpSVldNTyB0byBUU08uIFRoZSBhY3RpdmUg
Y29uc2lzdGVuY3kgbW9kZWwgY2FuIHRoZXJlZm9yZSBiZSBzd2l0Y2hlZCBvbiBhCnBlci1oYXJ0
IGJhc2UgYW5kIG1hbmFnZWQgYnkgdGhlIGtlcm5lbCBvbiBhIHBlci1wcm9jZXNzIGJhc2UuCgpU
aGlzIHBhdGNoc2V0IGltcGxlbWVudHMgYmFzaWMgU3NkdHNvIHN1cHBvcnQgYW5kIGFkZHMgYSBw
cmN0bCBBUEkgb24gdG9wCnNvIHRoYXQgdXNlci1zcGFjZSBwcm9jZXNzZXMgY2FuIHN3aXRjaCB0
byBhIHN0cm9uZ2VyIG1lbW9yeSBjb25zaXN0ZW5jeQptb2RlbCAodGhhbiB0aGUga2VybmVsIHdh
cyB3cml0dGVuIGZvcikgYXQgcnVuLXRpbWUuClRoZSBwYXRjaHNldCBhbHNvIGNvbWVzIHdpdGgg
YSBzaG9ydCBkb2N1bWVudGF0aW9uIG9mIHRoZSBwcmN0bCBBUEkuCgpUaGlzIHNlcmllcyBpcyBi
YXNlZCBvbiB0aGUgdGhpcmQgZHJhZnQgb2YgdGhlIFNzZHRzbyBzcGVjaWZpY2F0aW9uCndoaWNo
IGNhbiBiZSBmb3VuZCBoZXJlOgogIGh0dHBzOi8vZ2l0aHViLmNvbS9yaXNjdi9yaXNjdi1zc2R0
c28vcmVsZWFzZXMvdGFnL3YxLjAtZHJhZnQzCk5vdGUsIHRoYXQgdGhlIFNzZHRzbyBzcGVjaWZp
Y2F0aW9uIGlzIGluIGRldmVsb3BtZW50IHN0YXRlCihpLmUuLCBub3QgZnJvemVuIG9yIGV2ZW4g
cmF0aWZpZWQpIHdoaWNoIGlzIGFsc28gdGhlIHJlYXNvbgp3aHkgdGhpcyBzZXJpZXMgaXMgbWFy
a2VkIGFzIFJGQy4KClRoaXMgc2VyaWVzIHNhdyB0aGUgZm9sbG93aW5nIGNoYW5nZXMgc2luY2Ug
djE6CiogUmVvcmRlcmVkL3Jlc3RydWN0dXJlZCBwYXRjaGVzCiogRml4ZWQgYnVpbGQgaXNzdWVz
CiogQWRkcmVzc2VkIHR5cG9zCiogUmVtb3ZlZCBhYmlsaXR5IHRvIHN3aXRjaCBUU08tPldNTwoq
IE1vdmVkIHRoZSBzdGF0ZSBmcm9tIHBlci10aHJlYWQgdG8gcGVyLXByb2Nlc3MKKiBSZXNjaGVk
dWxlIGFsbCBDUFVzIGFmdGVyIHN3aXRjaGluZwoqIFNvbWUgY2xlYW51cHMgaW4gdGhlIGRvY3Vt
ZW50YXRpb24KKiBBZGRpbmcgY29tcGF0aWJpbGl0eSB3aXRoIFp0c28gKHNwZWMgY2hhbmdlIGlu
IGRyYWZ0IDMpCgpUaGlzIHBhdGNoc2V0IGNhbiBhbHNvIGJlIGZvdW5kIGluIHRoaXMgR2l0SHVi
IGJyYW5jaDoKICBodHRwczovL2dpdGh1Yi5jb20vY211ZWxsbmVyL2xpbnV4L3RyZWUvc3NkdHNv
LXYyCgpBIFFFTVUgaW1wbGVtZW50YXRpb24gb2YgRFRTTyBjYW4gYmUgZm91bmQgaW4gdGhpcyBH
aXRIdWIgYnJhbmNoOgogIGh0dHBzOi8vZ2l0aHViLmNvbS9jbXVlbGxuZXIvcWVtdS90cmVlL3Nz
ZHRzby12MgoKQ2hyaXN0b3BoIE3DvGxsbmVyICg2KToKICBtbTogQWRkIGR5bmFtaWMgbWVtb3J5
IGNvbnNpc3RlbmN5IG1vZGVsIHN3aXRjaGluZwogIHVhcGk6IHByY3RsOiBBZGQgbmV3IHByY3Rs
IGNhbGwgdG8gc2V0L2dldCB0aGUgbWVtb3J5IGNvbnNpc3RlbmN5CiAgICBtb2RlbAogIFJJU0Mt
VjogRW5hYmxlIGR5bmFtaWMgbWVtb3J5IGNvbnNpc3RlbmN5IG1vZGVsIHN1cHBvcnQgd2l0aCBT
c2R0c28KICBSSVNDLVY6IEltcGxlbWVudCBwcmN0bCBjYWxsIHRvIHNldC9nZXQgdGhlIG1lbW9y
eSBjb25zaXN0ZW5jeSBtb2RlbAogIFJJU0MtVjogRXhwb3NlIFNzZHRzbyB2aWEgaHdwcm9iZSBB
UEkKICBSSVNDLVY6IHNlbGZ0ZXN0czogQWRkIERUU08gdGVzdHMKCiBEb2N1bWVudGF0aW9uL2Fy
Y2gvcmlzY3YvaHdwcm9iZS5yc3QgICAgICAgICAgfCAgMyArCiAuLi4vbW0vZHluYW1pYy1tZW1v
cnktY29uc2lzdGVuY3ktbW9kZWwucnN0ICAgfCA4NiArKysrKysrKysrKysrKysrCiBEb2N1bWVu
dGF0aW9uL21tL2luZGV4LnJzdCAgICAgICAgICAgICAgICAgICAgfCAgMSArCiBhcmNoL0tjb25m
aWcgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAxNCArKysKIGFyY2gvcmlzY3Yv
S2NvbmZpZyAgICAgICAgICAgICAgICAgICAgICAgICAgICB8IDExICsrKwogYXJjaC9yaXNjdi9p
bmNsdWRlL2FzbS9jc3IuaCAgICAgICAgICAgICAgICAgIHwgIDEgKwogYXJjaC9yaXNjdi9pbmNs
dWRlL2FzbS9kdHNvLmggICAgICAgICAgICAgICAgIHwgOTcgKysrKysrKysrKysrKysrKysrKwog
YXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9od2NhcC5oICAgICAgICAgICAgICAgIHwgIDEgKwogYXJj
aC9yaXNjdi9pbmNsdWRlL2FzbS9wcm9jZXNzb3IuaCAgICAgICAgICAgIHwgIDcgKysKIGFyY2gv
cmlzY3YvaW5jbHVkZS9hc20vc3dpdGNoX3RvLmggICAgICAgICAgICB8ICAzICsKIGFyY2gvcmlz
Y3YvaW5jbHVkZS91YXBpL2FzbS9od3Byb2JlLmggICAgICAgICB8ICAxICsKIGFyY2gvcmlzY3Yv
a2VybmVsL01ha2VmaWxlICAgICAgICAgICAgICAgICAgICB8ICAxICsKIGFyY2gvcmlzY3Yva2Vy
bmVsL2FzbS1vZmZzZXRzLmMgICAgICAgICAgICAgICB8ICAzICsKIGFyY2gvcmlzY3Yva2VybmVs
L2NwdWZlYXR1cmUuYyAgICAgICAgICAgICAgICB8ICAxICsKIGFyY2gvcmlzY3Yva2VybmVsL2R0
c28uYyAgICAgICAgICAgICAgICAgICAgICB8IDY3ICsrKysrKysrKysrKysKIGFyY2gvcmlzY3Yv
a2VybmVsL3N5c19od3Byb2JlLmMgICAgICAgICAgICAgICB8ICAyICsKIGluY2x1ZGUvbGludXgv
c2NoZWQuaCAgICAgICAgICAgICAgICAgICAgICAgICB8ICA1ICsKIGluY2x1ZGUvdWFwaS9saW51
eC9wcmN0bC5oICAgICAgICAgICAgICAgICAgICB8ICA1ICsKIGtlcm5lbC9zeXMuYyAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICB8IDEyICsrKwogdG9vbHMvdGVzdGluZy9zZWxmdGVz
dHMvcmlzY3YvTWFrZWZpbGUgICAgICAgIHwgIDIgKy0KIHRvb2xzL3Rlc3Rpbmcvc2VsZnRlc3Rz
L3Jpc2N2L2R0c28vLmdpdGlnbm9yZSB8ICAxICsKIHRvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL3Jp
c2N2L2R0c28vTWFrZWZpbGUgICB8IDExICsrKwogdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvcmlz
Y3YvZHRzby9kdHNvLmMgICAgIHwgODIgKysrKysrKysrKysrKysrKwogMjMgZmlsZXMgY2hhbmdl
ZCwgNDE2IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKIGNyZWF0ZSBtb2RlIDEwMDY0NCBE
b2N1bWVudGF0aW9uL21tL2R5bmFtaWMtbWVtb3J5LWNvbnNpc3RlbmN5LW1vZGVsLnJzdAogY3Jl
YXRlIG1vZGUgMTAwNjQ0IGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vZHRzby5oCiBjcmVhdGUgbW9k
ZSAxMDA2NDQgYXJjaC9yaXNjdi9rZXJuZWwvZHRzby5jCiBjcmVhdGUgbW9kZSAxMDA2NDQgdG9v
bHMvdGVzdGluZy9zZWxmdGVzdHMvcmlzY3YvZHRzby8uZ2l0aWdub3JlCiBjcmVhdGUgbW9kZSAx
MDA2NDQgdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvcmlzY3YvZHRzby9NYWtlZmlsZQogY3JlYXRl
IG1vZGUgMTAwNjQ0IHRvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL3Jpc2N2L2R0c28vZHRzby5jCgot
LSAKMi40My4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNj
dgo=
