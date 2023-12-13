Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F4052C4332F
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Dec 2023 13:13:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=EvONdeuZOf07o2/qKv3KqW2Iog/Mzd7QGJe0TNv705M=; b=eKxO/siNu9+J5q
	pI/HIopUQthccRc4cNf/00EiJ6V8SkF9aeN/TGOn/tEwpbw3iFFt8nDkt+l3G/aXX1j8iR/xusdDX
	rxlzvOBpQJL/6THAEY6n0CzmZpjdT0Y1g+7G8t+ehgVlMGBl8AskGTj/hx/ubkx7aLOYJuPdNYu9B
	mQPqN68blSv3YS+slGt603q6GxwWjHD1w60Pq1c+73e7uRJ7i2dIFx09c9C/cvEFLXMGxPyVEa7zM
	zey2v0GNhnIYcqKmwW4SaSVIpmRSpZrNvq36EC5PdqernDlXTGGkTeCpTQth17vE9LoDFx/+nLZUR
	w9t2VBCKvQxmWDqhWn1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rDP3b-00Ekov-1I;
	Wed, 13 Dec 2023 13:13:47 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rDP3X-00Eknd-1S
	for linux-riscv@lists.infradead.org;
	Wed, 13 Dec 2023 13:13:45 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-6ce939ecfc2so6272946b3a.2
        for <linux-riscv@lists.infradead.org>; Wed, 13 Dec 2023 05:13:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1702473219; x=1703078019; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WFwtIbL//4RaPbpliYdco6dnfSaYDCPRp10C0v7FTQ8=;
        b=QF+9WL/COwXEqDTKkyDilpTb35CQOO6uoP0ocaEoP8k+QDSLvErKqHtHtEEnf8FCSy
         jGk3c/ekI0kW/RsyZv6cvpNkYXCu0hAMobW/oN9MENCKveq7O0tYglPmOTyxyiEWHVpc
         +lq9Jajmw9uJSwWUpzarCqQOuqasn6CbE+GaAAj9J8eb5V9HUCftOPyefgXqtD3FAuJY
         1ovVgoFJTdJErX5BBr7LopULQjGtL96bRKD5mPNkAobiiOzYuTQuKE6EKFvpcn7qZKFS
         fvsPkfT9Y92wz4Eq9GoeuQgREtagPtoq3C/4k79zNqn30lW9esVr0xTmeVTYVbWx3Uxc
         Bghg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702473219; x=1703078019;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WFwtIbL//4RaPbpliYdco6dnfSaYDCPRp10C0v7FTQ8=;
        b=MYqj7LXGTu69wAG9shYxDAxm9gbaweY6GnNYFRGLzanlkR+5lQZUGoajJBh+EQue8A
         FlcrcQ5NsunTyesxbkLbXXIgAVj5NstQ+LZr7MJ2xXhkEi2qcT/yIALZDiajiJ0RO7CJ
         1kxL54SqL54s/u3RLjgOj6BzhkP0uePLNRvhkBIQ5DLZCmmIAwwNqLA1h9Phx01voJWk
         ExoyLTk/PdxHjUxCyGMnA/fmihcT0evgLtPnAWvgAcISlbAy1BgEpw+r1aNUR67YCQ1u
         ofk74csx1rZQZOSILsjQqmMBE0jQgismNPlJFeE2quYkgCxDSbD4SYHVHVVN8WnMXj1/
         2fOw==
X-Gm-Message-State: AOJu0Yxsyl/dY2c/ul4POfgrgUSOzb5269ofGkpCDZvFiCAzIW30ZnkQ
	aUkmnRoOkqt8wyMoek06zJx2+E9s1SdgdACkFWZuKW0VMos0//FMdJX9GvvcY6cHgdW7WXll/sT
	c50oe4G9X2NRXVY6twCuZKx63KJGlEqGnO3Q5tUl0DJz/Uff+5oEShfRQ9YWvctJ3buEKBg/hE9
	v7VdajV/AiqsvS
X-Google-Smtp-Source: AGHT+IFlnotUmYrqQ4cJxOVP9Ctj3xHckr0CCDzE43+hY4W3MD9qa/emjKr2RJYDljZq1SYeq07fUw==
X-Received: by 2002:a05:6a00:1798:b0:6cb:a93c:dfd1 with SMTP id s24-20020a056a00179800b006cba93cdfd1mr9542257pfg.14.1702473218927;
        Wed, 13 Dec 2023 05:13:38 -0800 (PST)
Received: from hsinchu26.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id fn7-20020a056a002fc700b006cecaff9e29sm9928601pfb.128.2023.12.13.05.13.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Dec 2023 05:13:38 -0800 (PST)
From: Andy Chiu <andy.chiu@sifive.com>
To: linux-riscv@lists.infradead.org,
	palmer@dabbelt.com
Cc: greentime.hu@sifive.com,
	guoren@linux.alibaba.com,
	bjorn@kernel.org,
	charlie@rivosinc.com,
	ardb@kernel.org,
	arnd@arndb.de,
	Andy Chiu <andy.chiu@sifive.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Subject: [v4, 0/6] riscv: support kernel-mode Vector
Date: Wed, 13 Dec 2023 13:13:15 +0000
Message-Id: <20231213131321.12862-1-andy.chiu@sifive.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231213_051343_541831_31943606 
X-CRM114-Status: GOOD (  14.26  )
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

VGhpcyBzZXJpZXMgcHJvdmlkZXMgc3VwcG9ydCBmb3IgcnVubmluZyBWZWN0b3IgY29kZSBpbiBr
ZXJuZWwgbW9kZS4KQWxvbmcgd2l0aCB0aGUgc3Vwb3J0LCB3ZSBhZGQgc29tZSBWZWN0b3Igb3B0
aW1pemVkIHJvdXRpbmVzLiBBbmQKcHJvdmlkZSBhIHNpbXBsZSB0aHJlc2hvbGQgdG8gZGVjaWRl
IHdoZW4gdG8gcnVuIHRoZSB2ZWN0b3JpemVkCmZ1bmN0aW9ucy4KCldlIGRlY2lkZWQgdG8gc3Bs
aXQgdGhlIHBhdGNoIHNlcmllcyBpbnRvIDIgcGFydHMuIFRoZSBmaXJzdCBwYXJ0CmNvbnRhaW5z
IHJ1bm5pbmcga2VybmVsLW1vZGUgVmVjdG9yIHdpdGggcHJlZW1wdGlvbiBkaXNhYmxlZC4gVGhl
IHNlY29uZApwYXJ0IHdpbGwgYWRkIHN1cHBvcnQgZm9yIHJ1bm5pbmcgVmVjdG9yIHdpdGggcHJl
ZW1wdGlvbi4KClRoaXMgcGF0Y2ggaXMgdGVzdGVkIG9uIGEgUUVNVSB3aXRoIFYgYW5kIHZlcmlm
aWVkIHRoYXQgYm9vdGluZywgbm9ybWFsCnVzZXJzcGFjZSBvcGVyYXRpb25zIGFsbCB3b3JrIGFz
IHVzdWFsIHdpdGggdGhyZXNob2xkcyBzZXQgdG8gMC4KCnYzIG9mIHRoaXMgc2VyaWVzIGNhbiBi
ZSBmb3VuZCBhdCBbMV0KCkxpbms6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8yMDIzMTAx
OTE1NDU1Mi4yMzM1MS0xLWFuZHkuY2hpdUBzaWZpdmUuY29tLwoKUGF0Y2ggc3VtbWFyeSAob24g
Y3VycmVudCBvcmRlcik6CiAtIFVwZGF0ZWQgcGF0Y2hlczogMSwgNAogLSBOZXcgcGF0Y2g6IDIs
IDUsIDYKIC0gVW5jaGFuZ2VkIHBhdGNoOiAzCiAtIERlbGV0ZWQgcGF0Y2g6IFBhdGNoZXMgcmVs
YXRlZCB0byBwcmVlbXB0X3Ygd2lsbCBiZSBzZW50IHNlcGFyYXRlbHkKCkNoYW5nZWxvZyB2NDoK
IC0gUmViYXNlIG9uIHRvcCBvZiByaXNjdiBmb3ItbmV4dCAoNi43LXJjMSkKIC0gVXNlIGtlcm5l
bF92X2ZsYWdzIGFuZCBoZWxwZXJzIHRvIHRyYWNrIHZlY3RvciBjb250ZXh0LgogLSBQcmV2ZW50
IHNvZnRpcnEgZnJvbSBuZXN0aW5nIFYgY29udGV4dCBmb3Igbm9uLXByZWVtcHQgVgogLSBBZGQg
dXNlciBjb3B5IGFuZCBtZW0qIHJvdXRpbmVzCgpDaGFuZ2Vsb2cgdjM6CiAtIFJlYmFzZSBvbiB0
b3Agb2YgcmlzY3YgZm9yLW5leHQgKDYuNi1yYzEpCiAtIEZpeCBhIGJ1aWxkIGlzc3VlIChDb25v
cikKIC0gR3VhcmQgdnN0YXRlX3NhdmUsIHZzdGF0ZV9yZXN0b3JlIHdpdGgge2dldCxwdXR9X2Nw
dV92ZWN0b3JfY29udGV4dC4KIC0gU2F2ZSBWIGNvbnRleHQgYWZ0ZXIgZGlzYWJsaW5nIHByZWVt
cHRpb24uIChHdW8pCiAtIFJlbW92ZSBpcnFzX2Rpc2FibGVkKCkgY2hlY2sgZnJvbSBtYXlfdXNl
X3NpbWQoKS4gKEJqw7ZybikKIC0gQ29tbWVudCBhYm91dCBuZXN0aW5nIFYgY29udGV4dC4KCkNo
YW5nZWxvZyB2MjoKIC0gZml4IGJ1aWxkIGlzc3VlcwogLSBGb2xsb3cgYXJtJ3Mgd2F5IG9mIHN0
YXJ0aW5nIGtlcm5lbC1tb2RlIHNpbWQgY29kZToKICAgLSBhZGQgaW5jbHVkZS9hc20vc2ltZC5o
IGFuZCByZW5hbWUgbWF5X3VzZV92ZWN0b3IoKSAtPgogICAgIG1heV91c2Vfc2ltZCgpCiAgIC0g
cmV0dXJuIHZvaWQgaW4ga2VybmVsX3ZlY3Rvcl9iZWdpbigpLCBhbmQgQlVHX09OIGlmIG1heV91
c2Vfc2ltZCgpCiAgICAgZmFpbHMKIC0gQ2hhbmdlIG5hbWluZyBzY2hlbWUgZm9yIGZ1bmN0aW9u
cy9tYWNyb3MgKENvbm9yKToKICAgLSByZW1vdmUgS01WCiAgIC0gJ3MvcnZ2L3ZlY3Rvci8nCiAg
IC0gJ3MvUklTQ1ZfSVNBX1ZfUFJFRU1QVElWRV9LTVYvUklTQ1ZfSVNBX1ZfUFJFRU1QVElWRS8n
CiAgIC0gJ3MvVElGX1JJU0NWX1ZfS01WL1RJRl9SSVNDVl9WX0tFUk5FTF9NT0RFLycKCkFuZHkg
Q2hpdSAoNCk6CiAgcmlzY3Y6IHZlY3RvcjogbWFrZSBWZWN0b3IgYWx3YXlzIGF2YWlsYWJsZSBm
b3Igc29mdGlycSBjb250ZXh0CiAgcmlzY3Y6IHNjaGVkOiBkZWZlciByZXN0b3JpbmcgVmVjdG9y
IGNvbnRleHQgZm9yIHVzZXIKICByaXNjdjogbGliOiB2ZWN0b3JpemUgY29weV90b191c2VyL2Nv
cHlfZnJvbV91c2VyCiAgcmlzY3Y6IGxpYjogYWRkIHZlY3Rvcml6ZWQgbWVtKiByb3V0aW5lcwoK
R3JlZW50aW1lIEh1ICgyKToKICByaXNjdjogQWRkIHN1cHBvcnQgZm9yIGtlcm5lbCBtb2RlIHZl
Y3RvcgogIHJpc2N2OiBBZGQgdmVjdG9yIGV4dGVuc2lvbiBYT1IgaW1wbGVtZW50YXRpb24KCiBh
cmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2VudHJ5LWNvbW1vbi5oICB8ICAxNyArKysrKwogYXJjaC9y
aXNjdi9pbmNsdWRlL2FzbS9wcm9jZXNzb3IuaCAgICAgfCAgMTUgKysrLQogYXJjaC9yaXNjdi9p
bmNsdWRlL2FzbS9zaW1kLmggICAgICAgICAgfCAgNDYgKysrKysrKysrKysKIGFyY2gvcmlzY3Yv
aW5jbHVkZS9hc20vdGhyZWFkX2luZm8uaCAgIHwgICAyICsKIGFyY2gvcmlzY3YvaW5jbHVkZS9h
c20vdmVjdG9yLmggICAgICAgIHwgIDMyICsrKysrKystCiBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNt
L3hvci5oICAgICAgICAgICB8ICA4MiArKysrKysrKysrKysrKysrKysrKwogYXJjaC9yaXNjdi9r
ZXJuZWwvTWFrZWZpbGUgICAgICAgICAgICAgfCAgIDEgKwogYXJjaC9yaXNjdi9rZXJuZWwva2Vy
bmVsX21vZGVfdmVjdG9yLmMgfCAxMDEgKysrKysrKysrKysrKysrKysrKysrKysrKwogYXJjaC9y
aXNjdi9rZXJuZWwvcHJvY2Vzcy5jICAgICAgICAgICAgfCAgIDQgKy0KIGFyY2gvcmlzY3Yva2Vy
bmVsL3B0cmFjZS5jICAgICAgICAgICAgIHwgICA1ICstCiBhcmNoL3Jpc2N2L2tlcm5lbC9zaWdu
YWwuYyAgICAgICAgICAgICB8ICAgNSArLQogYXJjaC9yaXNjdi9rZXJuZWwvdmVjdG9yLmMgICAg
ICAgICAgICAgfCAgIDIgKy0KIGFyY2gvcmlzY3YvbGliL01ha2VmaWxlICAgICAgICAgICAgICAg
IHwgICA2ICsrCiBhcmNoL3Jpc2N2L2xpYi9tZW1jcHlfdmVjdG9yLlMgICAgICAgICB8ICAyOSAr
KysrKysrCiBhcmNoL3Jpc2N2L2xpYi9tZW1tb3ZlX3ZlY3Rvci5TICAgICAgICB8ICA0OSArKysr
KysrKysrKysKIGFyY2gvcmlzY3YvbGliL21lbXNldC5TICAgICAgICAgICAgICAgIHwgICAyICst
CiBhcmNoL3Jpc2N2L2xpYi9tZW1zZXRfdmVjdG9yLlMgICAgICAgICB8ICAzMyArKysrKysrKwog
YXJjaC9yaXNjdi9saWIvcmlzY3Zfdl9oZWxwZXJzLmMgICAgICAgfCAgNTkgKysrKysrKysrKysr
KysrCiBhcmNoL3Jpc2N2L2xpYi91YWNjZXNzLlMgICAgICAgICAgICAgICB8ICAxMSArKysKIGFy
Y2gvcmlzY3YvbGliL3VhY2Nlc3NfdmVjdG9yLlMgICAgICAgIHwgIDU1ICsrKysrKysrKysrKysr
CiBhcmNoL3Jpc2N2L2xpYi94b3IuUyAgICAgICAgICAgICAgICAgICB8ICA4MSArKysrKysrKysr
KysrKysrKysrKwogMjEgZmlsZXMgY2hhbmdlZCwgNjMwIGluc2VydGlvbnMoKyksIDcgZGVsZXRp
b25zKC0pCiBjcmVhdGUgbW9kZSAxMDA2NDQgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9zaW1kLmgK
IGNyZWF0ZSBtb2RlIDEwMDY0NCBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3hvci5oCiBjcmVhdGUg
bW9kZSAxMDA2NDQgYXJjaC9yaXNjdi9rZXJuZWwva2VybmVsX21vZGVfdmVjdG9yLmMKIGNyZWF0
ZSBtb2RlIDEwMDY0NCBhcmNoL3Jpc2N2L2xpYi9tZW1jcHlfdmVjdG9yLlMKIGNyZWF0ZSBtb2Rl
IDEwMDY0NCBhcmNoL3Jpc2N2L2xpYi9tZW1tb3ZlX3ZlY3Rvci5TCiBjcmVhdGUgbW9kZSAxMDA2
NDQgYXJjaC9yaXNjdi9saWIvbWVtc2V0X3ZlY3Rvci5TCiBjcmVhdGUgbW9kZSAxMDA2NDQgYXJj
aC9yaXNjdi9saWIvcmlzY3Zfdl9oZWxwZXJzLmMKIGNyZWF0ZSBtb2RlIDEwMDY0NCBhcmNoL3Jp
c2N2L2xpYi91YWNjZXNzX3ZlY3Rvci5TCiBjcmVhdGUgbW9kZSAxMDA2NDQgYXJjaC9yaXNjdi9s
aWIveG9yLlMKCi0tIAoyLjE3LjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXJpc2N2Cg==
