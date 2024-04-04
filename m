Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8147ACD1284
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Apr 2024 11:42:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ddYPOCkHgImJ1CCHmFB/aH7U8ZG9dRYiOYSSbt2e1vk=; b=iPNruq01bf5wuV
	Qbai0WTqk0daBJVG116lsp8gdF9Nob8iFofmmlSnYpwq0fWEs+b24/HVTe/8OrUh/Soy1Pyv2NV4i
	OPVlDA0wcXMI2FV//GYJwtjNGWtXUBus6Q2VLLNwC7nq77c4d8UQC/p8FP7UOdrwu/VV1Jyqai+iw
	4g7XVTNSIe03WM5bK7NNmW5xE01KvPx/Q+zboR1qQkXwJoXN0xXH/eqgSJEhXRw0OUTpMQuvwz9wF
	MvYjAbH7FANvqEQuesh+UnAhXzMdMqM1XYPbYg38GJOo++ozUvA9XAzYRFcuJAXKb0iND1ST7CSTc
	uDNLSchiSKRPSr6sPCKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsLUP-00000002PAh-3O7R;
	Thu, 04 Apr 2024 11:42:41 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsLUL-00000002P7h-3yF1
	for linux-riscv@lists.infradead.org;
	Thu, 04 Apr 2024 11:42:40 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-4162b74f2a1so2351805e9.3
        for <linux-riscv@lists.infradead.org>; Thu, 04 Apr 2024 04:42:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712230954; x=1712835754; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=V/9UaWH58JbSSliu9hWrazNjsMfAiTpooxWMtLVHRkQ=;
        b=WTzRCIVWeNCQgmdSuxTVTc+qvh0P0HQhxMHwJN0KvwkkH7K1Rc3SQg5/fxj82eBQZY
         0gVxajWz0r5oKG5BlyI6uhksJGcAZ+75y+2gPIhWLDz8mtZ0dHLhzAILIC5hbF9GV8S/
         jV5RcGoUIv3uQ0UwWF+O7wnfJviqmTYKdmD9owCbf/Xv5cF8HwG3+nQr2S9ziN/XkUvx
         XvnkZa8hHtQ9aUTSVyslXym93oiIyXwYU8p3eb5zPmjPqZoHxhtvMNyBeFFMzNBl0ZMV
         TiH9SZ2SP4OR9Ehi0JoGMX0aR1dBokUqFEwOxjSRcCzJ8e7WXPRBjxzysdNxUE8apEnM
         eNWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712230954; x=1712835754;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V/9UaWH58JbSSliu9hWrazNjsMfAiTpooxWMtLVHRkQ=;
        b=Icc8C29inrhloceMWTlJwGN5EvQxGMqXli3EFtCZLqRRdhwhEmG8S96rZpnKUTJ5Nd
         /Q6egqz0QuuZeu3ESUuA9xbYH+S7gmBlE64XRZpmPTRoN2YI7MUsBM0k++VKfR25U2kR
         xz9RhXX+oaaf+Hk181SJoQOAPRM2UaImVKfUSdOZKI93VxSYX5bIAm3UxGo6Ed21psUB
         oSYqQGwsIlp1UB/hsIwQsp0haeYmcbbTZ5SuzdSkwaPQ8ma49HEs+Yl+aFdE2ZiiK2zH
         is/kYpR+2A62ZeePJHUeFbPCrJ+iTyrGvkD9J2qgRYzRm4c1IVyU6Bsaw1PFUw1heUHY
         FmCA==
X-Forwarded-Encrypted: i=1; AJvYcCUZLMrZmwRIe2HVAsv5NDrHYFqZ+nYfbEL7nZZ/O0YigeNz9FI98gN4e4JCJl78byuoldhLb56JqKSy5mF1h7XjXGRU3d8gsN+fu2yYcvVx
X-Gm-Message-State: AOJu0YxGkx72sJjME/jAONFwdsZTXMkRTheJ16RzqHvQuC9D81424Mxw
	a2F61s/QPp9SHtRSBokfPZodAk4oEo2V6zEVN9XfFvGEPqYj0sZ8
X-Google-Smtp-Source: AGHT+IH4vjW4HOFwL0nxbzJW32/tQIfeK4E02sLbTVajHqefX6+EkRKk3hQ3JvJK5+Y61Zy5YxGxEg==
X-Received: by 2002:a05:600c:310b:b0:416:2485:e6ce with SMTP id g11-20020a05600c310b00b004162485e6cemr1984611wmo.22.1712230953991;
        Thu, 04 Apr 2024 04:42:33 -0700 (PDT)
Received: from localhost (54-240-197-231.amazon.com. [54.240.197.231])
        by smtp.gmail.com with ESMTPSA id v9-20020a05600c470900b0041568e91c41sm2411599wmo.41.2024.04.04.04.42.32
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 04 Apr 2024 04:42:33 -0700 (PDT)
From: Puranjay Mohan <puranjay12@gmail.com>
To: Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	John Fastabend <john.fastabend@gmail.com>,
	KP Singh <kpsingh@kernel.org>,
	Stanislav Fomichev <sdf@google.com>,
	Hao Luo <haoluo@google.com>,
	Jiri Olsa <jolsa@kernel.org>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>,
	Luke Nelson <luke.r.nels@gmail.com>,
	Xi Wang <xi.wang@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	bpf@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Pu Lehui <pulehui@huaweicloud.com>
Cc: puranjay12@gmail.com
Subject: [PATCH bpf-next v4 0/2] bpf,riscv: Add support for BPF Arena
Date: Thu,  4 Apr 2024 11:42:01 +0000
Message-Id: <20240404114203.105970-1-puranjay12@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240404_044238_248779_4E3AB3C7 
X-CRM114-Status: GOOD (  10.78  )
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

Q2hhbmdlcyBpbiBWNDoKVjM6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8yMDI0MDMyNjIy
NDk0My44NjkxMi0xLXB1cmFuamF5MTJAZ21haWwuY29tLwotIEZpeCBzb21lIHN0eWxlIGlzc3Vl
cy4KLSBBZGQgVGVzdGVkLWJ5OiBhbmQgUmV2aWV3ZWQtYnk6IHRhZ3MgYnkgUHUgTGVodWkgYW5k
IEJqw7ZybgoKQ2hhbmdlcyBpbiBWMwpWMjogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYnBmLzIw
MjQwMzI1MTU1NDM0LjY1NTg5LTEtcHVyYW5qYXkxMkBnbWFpbC5jb20vCi0gVXNlIFJFR19ET05U
X0NMRUFSX01BUktFUiBpbiBwbGFjZSBvZiBET05UX0NMRUFSIGFzIHRoZSBuYW1lLgotIFVzZSBS
Vl9SRUdfWkVSTyBmb3IgdGhlIGFib3ZlIGFzIGl0IGlzIGd1YXJhbnRlZWQgdG8gYmUgbmV2ZXIg
dXNlZCBpbiBhcwogIGRzdC9zcmMgcmVnaXN0ZXIgaW4gQlBGIExEWC9TVFgvU1QgaW5zdHJ1Y3Rp
b25zLgotIFVzZSAjZGVmaW5lIFJWX1JFR19BUkVOQSBmb3IgUlZfUkVHX1M3CgpDaGFuZ2VzIGlu
IFYyClYxOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9icGYvMjAyNDAzMjMxNTQ2NTIuNTQ1NzIt
MS1wdXJhbmpheTEyQGdtYWlsLmNvbS8KLSBVc2VkIFM3IGluIHBsYWNlIG9mIFMxMSBmb3Igc3Rv
cmluZyB0aGUga2VybmVsX3ZtX3N0YXJ0Ci0gVXNlZCAxNyBpbiBwbGFjZSBvZiAxNiBmb3IgRE9O
VF9DTEVBUiBtYXJrZXIKLSBSZW1vdmUgYW4gdW51c2VkIHZhcmlhYmxlCi0gUmVtb3ZlZCBzb21l
IG1pc2xlYWRpbmcgaW5mb3JtYXRpb24gZnJvbSB0aGUgY29tbWl0IG1lc3NhZ2UuCgpUaGlzIHNl
cmllcyBhZGRzIHRoZSBzdXBwb3J0IGZvciBQUk9CRV9NRU0zMiBhbmQgYnBmX2FkZHJfc3BhY2Vf
Y2FzdAppbnN0cnVjdGlvbnMgdG8gdGhlIFJJU0NWIEJQRiBKSVQuIFRoZXNlIHR3byBpbnN0cnVj
dGlvbnMgYWxsb3cgdGhlCmVuYWJsZW1lbnQgb2YgQlBGIEFyZW5hLgoKQWxsIGFyZW5hIHJlbGF0
ZWQgc2VsZnRlc3RzIGFyZSBwYXNzaW5nOgoKICByb290QHJ2LXRlc3Rlcjp+L2JwZiMgdW5hbWUg
LXAKICByaXNjdjY0CiAgcm9vdEBydi10ZXN0ZXI6fi9icGYjIC4vdGVzdF9wcm9ncyAtYSAiKmFy
ZW5hKiIKICAjMy8xICAgICBhcmVuYV9odGFiL2FyZW5hX2h0YWJfbGx2bTpPSwogICMzLzIgICAg
IGFyZW5hX2h0YWIvYXJlbmFfaHRhYl9hc206T0sKICAjMyAgICAgICBhcmVuYV9odGFiOk9LCiAg
IzQvMSAgICAgYXJlbmFfbGlzdC9hcmVuYV9saXN0XzE6T0sKICAjNC8yICAgICBhcmVuYV9saXN0
L2FyZW5hX2xpc3RfMTAwMDpPSwogICM0ICAgICAgIGFyZW5hX2xpc3Q6T0sKICAjNDM0LzEgICB2
ZXJpZmllcl9hcmVuYS9iYXNpY19hbGxvYzE6T0sKICAjNDM0LzIgICB2ZXJpZmllcl9hcmVuYS9i
YXNpY19hbGxvYzI6T0sKICAjNDM0LzMgICB2ZXJpZmllcl9hcmVuYS9iYXNpY19hbGxvYzM6T0sK
ICAjNDM0LzQgICB2ZXJpZmllcl9hcmVuYS9pdGVyX21hcHMxOk9LCiAgIzQzNC81ICAgdmVyaWZp
ZXJfYXJlbmEvaXRlcl9tYXBzMjpPSwogICM0MzQvNiAgIHZlcmlmaWVyX2FyZW5hL2l0ZXJfbWFw
czM6T0sKICAjNDM0ICAgICB2ZXJpZmllcl9hcmVuYTpPSwogIFN1bW1hcnk6IDMvMTAgUEFTU0VE
LCAwIFNLSVBQRUQsIDAgRkFJTEVECgpQdXJhbmpheSBNb2hhbiAoMik6CiAgYnBmLHJpc2N2OiBJ
bXBsZW1lbnQgUFJPQkVfTUVNMzIgcHNldWRvIGluc3RydWN0aW9ucwogIGJwZixyaXNjdjogSW1w
bGVtZW50IGJwZl9hZGRyX3NwYWNlX2Nhc3QgaW5zdHJ1Y3Rpb24KCiBhcmNoL3Jpc2N2L25ldC9i
cGZfaml0LmggICAgICAgIHwgICAyICsKIGFyY2gvcmlzY3YvbmV0L2JwZl9qaXRfY29tcDY0LmMg
fCAyMDMgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0KIGFyY2gvcmlzY3YvbmV0L2Jw
Zl9qaXRfY29yZS5jICAgfCAgIDIgKwogMyBmaWxlcyBjaGFuZ2VkLCAyMDUgaW5zZXJ0aW9ucygr
KSwgMiBkZWxldGlvbnMoLSkKCi0tIAoyLjQwLjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlz
Y3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
