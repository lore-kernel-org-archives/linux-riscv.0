Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB6F0D116E3
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Nov 2025 01:15:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ziCQ019dk3i1Wx2gDCnodj9ewtbh6dByZBUYRClvank=; b=kGK06Fl0YLRgFn
	Xhh/eh/14eyTKEZcHr0qZFNFl66ufmfMfusMROJjB0zabdkNs8sBTD53SBoeonhtcfptS7AopI2yM
	d4tuTPdbTKJnynBQETO0rM88rN/KPRVsYjQH5RXHOHVs/lCYQBWjtKaS8+8IbZXH2e/DREorY46Q+
	p9gHg9paRBslsSVYmyZyHws30YWYxVt4JjL3WCyp7Jw8e30R+CK5hXYI4gFKJmnG1+lrE3XhNzwe6
	fg4xkVnGk2odC47KRDv6hDsh91R2Jr9FzCEHLRt/+gxHqpTepM5HDftGFd52cxmBWiGIBUspQkYu5
	qt55a/jiTGy9U+g74Mbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOQbu-0000000FpxJ-2knd;
	Thu, 27 Nov 2025 01:15:50 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOQbs-0000000Fpw0-2svq
	for linux-riscv@lists.infradead.org;
	Thu, 27 Nov 2025 01:15:49 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-7baf61be569so350889b3a.3
        for <linux-riscv@lists.infradead.org>; Wed, 26 Nov 2025 17:15:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764206148; x=1764810948; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W4p1bn22G2i0XoJzrL7o1dUUJ8ghtmPDbFaXYxRwFkI=;
        b=P4mYjLU8mKFB8zD1TpAdXC8078OTkvaP9RYSrv/jQ+9hKM1DeQA6ttXOF0O0TvTkzs
         7wJ2JExalNB+0Vd0zSiwDihs7lwoz95A2FseMmlZeR88oPlqI876TaYmUqgPh0B5CKoQ
         //pN4YSPnAV/z+V3lEMw3KwZfaA/bBkKziXUkx8MmEoU5hmOG6EVN4Ju+zoedxUQt+Lr
         TO88UYGJRIrcNswmM3UO7mkiD1BxPt1CjIua+6tCbCNUWWhZotvGOiIMvXrjuzpVEDku
         JWh5TYrv5jghzjhmNJphG/WoFgx3piH0gaizMeKyhSuPXyx3xSppPPc4RqA+9qdw3EIF
         WDlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764206148; x=1764810948;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=W4p1bn22G2i0XoJzrL7o1dUUJ8ghtmPDbFaXYxRwFkI=;
        b=myTL7qh2EWxLRf4ickRQxhmmAUp6LNyHRN8M7uHDJzfLuHHRE6tu2YcguVaV8F0sPL
         nBZMgqHRXjsRwcVsWS9jXFtlFMcEei+62vg7zoO8tW8CEL5ZL8wO9RFWFu+0BZtt/tsB
         lC8g7YJzY8xlAReHVElebWYumc6FKTA32I6gZzKZmcSGtKVcmeZHpVDA2DgKyyNvBr7J
         QnOTOXnAmCBc0BvPnlEB5RQLYY7g8D4KvyrzW8NsF620HLgDCPflAs0gQYQTAIHMHCqT
         rjNgOjFz4U9SWba40B6h7luZWE8YqR0QSX1o0SqeJJo/YcL00c78O1+iHU6fHgIov8rJ
         zgLg==
X-Forwarded-Encrypted: i=1; AJvYcCWFNGWlh+tcH7xP+hwBxLt9K/otTQBTNuM4opDoXkkCIOZiIh7QzJ1GQOISyrDqGgQpN5Noij0nVxUtug==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx+8Qn9z+mChtUSlGpzN1fcaLVDZULhuHlPswDQIn868JyHac5L
	pgAv1MRFZIkBjf1VvZbvDFizmH2yugXF8aaNlDCFwwaE/7Ikg5PpEUGZ
X-Gm-Gg: ASbGncuof0H8mFXKd/VQE8a6OFIzxysNc6GUUG3DpkknOB3eSlwxEBWGaOlWGMXBoR7
	4Mt/SNxxtkdC6DyVH+XC74zgVT/XkEX1uL1qwEyuQ8DtsITMqpfkd+tEQ9uL4xCnRWNhsCvAZRi
	fs1JoTLc4+F1Mih9PFtn39MAHtV908oysfclkEgNv8yQ+X/YXTYTo7VLznKJXzPSY7jJsVsI47N
	kNky8KZYFZVLgiBm9rgYn4OWO+0eWjQvhsHyPoq2P8QeLVSBH96rSLNKS/vIbdMAooLUxdSYUUb
	54jH3XmVHGyznArCTm0rHdk0Hx2PiOGjMUfbtPhgHqKv8H1yw1phRMoYLEoNVLmC+8+S4DsFfYt
	64uYre+E2PO4uPL1EydeBPtU0KqW9LnMBSLKDBhqKizByGiz9u7jdAmX4QEzEkMYxTkeclXMvph
	9du+OzWIkypqPv9a2lYBY/RPyTCYpHzZRI5ts=
X-Google-Smtp-Source: AGHT+IHM/YJW2qPboNwUb7KDGSWGsZmmt6gqbwAlILL0AqNuX4PEwg/PSJbXIFKwaU4zyLqhhDzUUA==
X-Received: by 2002:a05:6a00:4616:b0:77f:2dc4:4c16 with SMTP id d2e1a72fcca58-7c58e016d67mr22034173b3a.21.1764206147616;
        Wed, 26 Nov 2025 17:15:47 -0800 (PST)
Received: from Barrys-MBP.hub ([47.72.129.29])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7c414c226f9sm22447356b3a.53.2025.11.26.17.15.27
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 26 Nov 2025 17:15:46 -0800 (PST)
From: Barry Song <21cnbao@gmail.com>
To: akpm@linux-foundation.org,
	linux-mm@kvack.org
Cc: Barry Song <v-songbaohua@oppo.com>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	"Liam R . Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Russell King <linux@armlinux.org.uk>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	x86@kernel.org,
	"H . Peter Anvin" <hpa@zytor.com>,
	Matthew Wilcox <willy@infradead.org>,
	Pedro Falcato <pfalcato@suse.de>,
	Jarkko Sakkinen <jarkko@kernel.org>,
	Oscar Salvador <osalvador@suse.de>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Oven Liyang <liyangouwen1@oppo.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Ada Couprie Diaz <ada.coupriediaz@arm.com>,
	Robin Murphy <robin.murphy@arm.com>,
	=?UTF-8?q?Kristina=20Mart=C5=A1enko?= <kristina.martsenko@arm.com>,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	Yeoreum Yun <yeoreum.yun@arm.com>,
	Wentao Guan <guanwentao@uniontech.com>,
	Thorsten Blum <thorsten.blum@linux.dev>,
	Steven Rostedt <rostedt@goodmis.org>,
	Yunhui Cui <cuiyunhui@bytedance.com>,
	Nam Cao <namcao@linutronix.de>,
	Chris Li <chrisl@kernel.org>,
	Kairui Song <kasong@tencent.com>,
	Kemeng Shi <shikemeng@huaweicloud.com>,
	Nhat Pham <nphamcs@gmail.com>,
	Baoquan He <bhe@redhat.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-fsdevel@vger.kernel.org
Subject: [RFC PATCH 2/2] mm/swapin: Retry swapin by VMA lock if the lock was released for I/O
Date: Thu, 27 Nov 2025 09:14:38 +0800
Message-Id: <20251127011438.6918-3-21cnbao@gmail.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20251127011438.6918-1-21cnbao@gmail.com>
References: <20251127011438.6918-1-21cnbao@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251126_171548_723837_13783A69 
X-CRM114-Status: GOOD (  16.91  )
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

RnJvbTogQmFycnkgU29uZyA8di1zb25nYmFvaHVhQG9wcG8uY29tPgoKSWYgdGhlIGN1cnJlbnQg
ZG9fc3dhcF9wYWdlKCkgdG9vayB0aGUgcGVyLVZNQSBsb2NrIGFuZCB3ZSBkcm9wcGVkIGl0IG9u
bHkKdG8gd2FpdCBmb3IgSS9PIGNvbXBsZXRpb24gKGUuZy4sIHVzZSBmb2xpb193YWl0X2xvY2tl
ZCgpKSwgdGhlbiB3aGVuCmRvX3N3YXBfcGFnZSgpIGlzIHJldHJpZWQgYWZ0ZXIgdGhlIEkvTyBj
b21wbGV0ZXMsIGl0IHNob3VsZCBzdGlsbCBxdWFsaWZ5CmZvciB0aGUgcGVyLVZNQS1sb2NrIHBh
dGguCgpDYzogRGF2aWQgSGlsZGVuYnJhbmQgPGRhdmlkQGtlcm5lbC5vcmc+CkNjOiBMb3Jlbnpv
IFN0b2FrZXMgPGxvcmVuem8uc3RvYWtlc0BvcmFjbGUuY29tPgpDYzogTGlhbSBSLiBIb3dsZXR0
IDxMaWFtLkhvd2xldHRAb3JhY2xlLmNvbT4KQ2M6IFZsYXN0aW1pbCBCYWJrYSA8dmJhYmthQHN1
c2UuY3o+CkNjOiBNaWtlIFJhcG9wb3J0IDxycHB0QGtlcm5lbC5vcmc+CkNjOiBTdXJlbiBCYWdo
ZGFzYXJ5YW4gPHN1cmVuYkBnb29nbGUuY29tPgpDYzogTWljaGFsIEhvY2tvIDxtaG9ja29Ac3Vz
ZS5jb20+CkNjOiBQYXVsIFdhbG1zbGV5IDxwandAa2VybmVsLm9yZz4KQ2M6IFBhbG1lciBEYWJi
ZWx0IDxwYWxtZXJAZGFiYmVsdC5jb20+CkNjOiBBbGJlcnQgT3UgPGFvdUBlZWNzLmJlcmtlbGV5
LmVkdT4KQ2M6IEFsZXhhbmRyZSBHaGl0aSA8YWxleEBnaGl0aS5mcj4KQ2M6IFJ1c3NlbGwgS2lu
ZyA8bGludXhAYXJtbGludXgub3JnLnVrPgpDYzogQ2F0YWxpbiBNYXJpbmFzIDxjYXRhbGluLm1h
cmluYXNAYXJtLmNvbT4KQ2M6IFdpbGwgRGVhY29uIDx3aWxsQGtlcm5lbC5vcmc+CkNjOiBIdWFj
YWkgQ2hlbiA8Y2hlbmh1YWNhaUBrZXJuZWwub3JnPgpDYzogV0FORyBYdWVydWkgPGtlcm5lbEB4
ZW4wbi5uYW1lPgpDYzogTWFkaGF2YW4gU3Jpbml2YXNhbiA8bWFkZHlAbGludXguaWJtLmNvbT4K
Q2M6IE1pY2hhZWwgRWxsZXJtYW4gPG1wZUBlbGxlcm1hbi5pZC5hdT4KQ2M6IE5pY2hvbGFzIFBp
Z2dpbiA8bnBpZ2dpbkBnbWFpbC5jb20+CkNjOiBDaHJpc3RvcGhlIExlcm95IDxjaHJpc3RvcGhl
Lmxlcm95QGNzZ3JvdXAuZXU+CkNjOiBBbGV4YW5kZXIgR29yZGVldiA8YWdvcmRlZXZAbGludXgu
aWJtLmNvbT4KQ2M6IEdlcmFsZCBTY2hhZWZlciA8Z2VyYWxkLnNjaGFlZmVyQGxpbnV4LmlibS5j
b20+CkNjOiBIZWlrbyBDYXJzdGVucyA8aGNhQGxpbnV4LmlibS5jb20+CkNjOiBWYXNpbHkgR29y
YmlrIDxnb3JAbGludXguaWJtLmNvbT4KQ2M6IENocmlzdGlhbiBCb3JudHJhZWdlciA8Ym9ybnRy
YWVnZXJAbGludXguaWJtLmNvbT4KQ2M6IFN2ZW4gU2NobmVsbGUgPHN2ZW5zQGxpbnV4LmlibS5j
b20+CkNjOiBEYXZlIEhhbnNlbiA8ZGF2ZS5oYW5zZW5AbGludXguaW50ZWwuY29tPgpDYzogQW5k
eSBMdXRvbWlyc2tpIDxsdXRvQGtlcm5lbC5vcmc+CkNjOiBQZXRlciBaaWpsc3RyYSA8cGV0ZXJ6
QGluZnJhZGVhZC5vcmc+CkNjOiBUaG9tYXMgR2xlaXhuZXIgPHRnbHhAbGludXRyb25peC5kZT4K
Q2M6IEluZ28gTW9sbmFyIDxtaW5nb0ByZWRoYXQuY29tPgpDYzogQm9yaXNsYXYgUGV0a292IDxi
cEBhbGllbjguZGU+CkNjOiB4ODZAa2VybmVsLm9yZwpDYzogSC4gUGV0ZXIgQW52aW4gPGhwYUB6
eXRvci5jb20+CkNjOiBNYXR0aGV3IFdpbGNveCA8d2lsbHlAaW5mcmFkZWFkLm9yZz4KQ2M6IFBl
ZHJvIEZhbGNhdG8gPHBmYWxjYXRvQHN1c2UuZGU+CkNjOiBKYXJra28gU2Fra2luZW4gPGphcmtr
b0BrZXJuZWwub3JnPgpDYzogT3NjYXIgU2FsdmFkb3IgPG9zYWx2YWRvckBzdXNlLmRlPgpDYzog
S3VuaW5vcmkgTW9yaW1vdG8gPGt1bmlub3JpLm1vcmltb3RvLmd4QHJlbmVzYXMuY29tPgpDYzog
T3ZlbiBMaXlhbmcgPGxpeWFuZ291d2VuMUBvcHBvLmNvbT4KQ2M6IE1hcmsgUnV0bGFuZCA8bWFy
ay5ydXRsYW5kQGFybS5jb20+CkNjOiBBZGEgQ291cHJpZSBEaWF6IDxhZGEuY291cHJpZWRpYXpA
YXJtLmNvbT4KQ2M6IFJvYmluIE11cnBoeSA8cm9iaW4ubXVycGh5QGFybS5jb20+CkNjOiBLcmlz
dGluYSBNYXJ0xaFlbmtvIDxrcmlzdGluYS5tYXJ0c2Vua29AYXJtLmNvbT4KQ2M6IEtldmluIEJy
b2Rza3kgPGtldmluLmJyb2Rza3lAYXJtLmNvbT4KQ2M6IFllb3JldW0gWXVuIDx5ZW9yZXVtLnl1
bkBhcm0uY29tPgpDYzogV2VudGFvIEd1YW4gPGd1YW53ZW50YW9AdW5pb250ZWNoLmNvbT4KQ2M6
IFRob3JzdGVuIEJsdW0gPHRob3JzdGVuLmJsdW1AbGludXguZGV2PgpDYzogU3RldmVuIFJvc3Rl
ZHQgPHJvc3RlZHRAZ29vZG1pcy5vcmc+CkNjOiBZdW5odWkgQ3VpIDxjdWl5dW5odWlAYnl0ZWRh
bmNlLmNvbT4KQ2M6IE5hbSBDYW8gPG5hbWNhb0BsaW51dHJvbml4LmRlPgpDYzogQ2hyaXMgTGkg
PGNocmlzbEBrZXJuZWwub3JnPgpDYzogS2FpcnVpIFNvbmcgPGthc29uZ0B0ZW5jZW50LmNvbT4K
Q2M6IEtlbWVuZyBTaGkgPHNoaWtlbWVuZ0BodWF3ZWljbG91ZC5jb20+CkNjOiBOaGF0IFBoYW0g
PG5waGFtY3NAZ21haWwuY29tPgpDYzogQmFvcXVhbiBIZSA8YmhlQHJlZGhhdC5jb20+CkNjOiBs
aW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmcKQ2M6IGxpbnV4LWtlcm5lbEB2Z2Vy
Lmtlcm5lbC5vcmcKQ2M6IGxvb25nYXJjaEBsaXN0cy5saW51eC5kZXYKQ2M6IGxpbnV4cHBjLWRl
dkBsaXN0cy5vemxhYnMub3JnCkNjOiBsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCkNj
OiBsaW51eC1zMzkwQHZnZXIua2VybmVsLm9yZwpDYzogbGludXgtbW1Aa3ZhY2sub3JnCkNjOiBs
aW51eC1mc2RldmVsQHZnZXIua2VybmVsLm9yZwpTaWduZWQtb2ZmLWJ5OiBCYXJyeSBTb25nIDx2
LXNvbmdiYW9odWFAb3Bwby5jb20+Ci0tLQogbW0vbWVtb3J5LmMgfCAxMCArKysrKysrKy0tCiAx
IGZpbGUgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdp
dCBhL21tL21lbW9yeS5jIGIvbW0vbWVtb3J5LmMKaW5kZXggNGY5MzNmZWRkMzNlLi43ZjcwZjAz
MjRkY2YgMTAwNjQ0Ci0tLSBhL21tL21lbW9yeS5jCisrKyBiL21tL21lbW9yeS5jCkBAIC00NjU0
LDYgKzQ2NTQsNyBAQCB2bV9mYXVsdF90IGRvX3N3YXBfcGFnZShzdHJ1Y3Qgdm1fZmF1bHQgKnZt
ZikKIAl1bnNpZ25lZCBsb25nIHBhZ2VfaWR4OwogCXVuc2lnbmVkIGxvbmcgYWRkcmVzczsKIAlw
dGVfdCAqcHRlcDsKKwlib29sIHJldHJ5X2J5X3ZtYV9sb2NrID0gZmFsc2U7CiAKIAlpZiAoIXB0
ZV91bm1hcF9zYW1lKHZtZikpCiAJCWdvdG8gb3V0OwpAQCAtNDc1OCw4ICs0NzU5LDEzIEBAIHZt
X2ZhdWx0X3QgZG9fc3dhcF9wYWdlKHN0cnVjdCB2bV9mYXVsdCAqdm1mKQogCiAJc3dhcGNhY2hl
ID0gZm9saW87CiAJcmV0IHw9IGZvbGlvX2xvY2tfb3JfcmV0cnkoZm9saW8sIHZtZik7Ci0JaWYg
KHJldCAmIFZNX0ZBVUxUX1JFVFJZKQorCWlmIChyZXQgJiBWTV9GQVVMVF9SRVRSWSkgeworCQlp
ZiAoZmF1bHRfZmxhZ19hbGxvd19yZXRyeV9maXJzdCh2bWYtPmZsYWdzKSAmJgorCQkgICAgISh2
bWYtPmZsYWdzICYgRkFVTFRfRkxBR19SRVRSWV9OT1dBSVQpICYmCisJCSAgICAodm1mLT5mbGFn
cyAmIEZBVUxUX0ZMQUdfVk1BX0xPQ0spKQorCQkJcmV0cnlfYnlfdm1hX2xvY2sgPSB0cnVlOwog
CQlnb3RvIG91dF9yZWxlYXNlOworCX0KIAogCXBhZ2UgPSBmb2xpb19maWxlX3BhZ2UoZm9saW8s
IHN3cF9vZmZzZXQoZW50cnkpKTsKIAkvKgpAQCAtNTA0NCw3ICs1MDUwLDcgQEAgdm1fZmF1bHRf
dCBkb19zd2FwX3BhZ2Uoc3RydWN0IHZtX2ZhdWx0ICp2bWYpCiAJfQogCWlmIChzaSkKIAkJcHV0
X3N3YXBfZGV2aWNlKHNpKTsKLQlyZXR1cm4gcmV0OworCXJldHVybiByZXQgfCAocmV0cnlfYnlf
dm1hX2xvY2sgPyBWTV9GQVVMVF9SRVRSWV9WTUEgOiAwKTsKIH0KIAogc3RhdGljIGJvb2wgcHRl
X3JhbmdlX25vbmUocHRlX3QgKnB0ZSwgaW50IG5yX3BhZ2VzKQotLSAKMi4zOS4zIChBcHBsZSBH
aXQtMTQ2KQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
