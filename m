Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78BFDD116E3
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Nov 2025 01:15:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ZPGdXZnmJrri1vXbJkrV/Cze8T6+TAl+PJxM9aK40lU=; b=t46DzFoAk4hLgL
	yd8m/urA2R0ivtSJvnbczGvU184m5UG2qRp0QbwwVwKKAHRIbHdXk9kvABsaf1/oVFKq84w8XpqBA
	KiVZItg9NE18y5/rAcGELMEfDoRW6Kp4wINVT1fJnuHhM7AqiP8Vp4Nkb8BFvWkAoIlwVuz9XiVgZ
	KZEztCwfYbYGW/rnBzRx98IAEy8SPEPc29y5IZCV5PUqqVIZv+XakxCU5kMQEGkTX0vHRmmX/2fL0
	ttXvUV+yFq9QKbg53smH3R1U4K1GTmEAxgKtQKJf25Yf1y7sTX1yVYJ0atXEDTPBuht4hcbKSsnoa
	xN19JqwCsEk8sHcThm1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOQbF-0000000Fpno-2e8t;
	Thu, 27 Nov 2025 01:15:09 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOQbD-0000000Fpn8-05dg
	for linux-riscv@lists.infradead.org;
	Thu, 27 Nov 2025 01:15:08 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-7b9a98b751eso242792b3a.1
        for <linux-riscv@lists.infradead.org>; Wed, 26 Nov 2025 17:15:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764206106; x=1764810906; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YN0BTLFbTgqhPvFlS+d/VYwmsgL4p5TAnUdzEI0ntIc=;
        b=U0Q8UAoT+nxiDXvf6aYY9IUY2auI5eZk/Al2PZeQ+uYrFPgDl3Tk7Rbv4nNQRKP0Z8
         tJGFqdu7RS8NbYKrXBBp1eeQ6TkTXyVkYF9g4CsZsYafRnqkxzvp9N7B3QnInt3x4iQ+
         w/Cvy//S9kq8HhXii/RY6TLOH0GE9Zo1+MFV+JH79KYvTr+rJ3qDXAV1hIDXjcIIwtbX
         PFrzcn2KkyvMpoF89gqYXCzAciSofzk7lNKnyG2N2TJw5804Hjbw68UIfc/j/eAl7uKR
         Dw5FFqQybN8Z8E3fPHgmR14Y/AdkejwDtAqTBXtmE1WSaqskUOsGNSl28xegpNpYK8Oc
         5bAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764206106; x=1764810906;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YN0BTLFbTgqhPvFlS+d/VYwmsgL4p5TAnUdzEI0ntIc=;
        b=kK5tA1snIKEa1EbpkEZ7E32kjizsAkPyl4O8n6fgU0eC9Jsgt4Y+wYtOntZwDBt3Hr
         mt/1pyU7lfN/f0suaQSEBTqIFvOY9TV8q3nLPZlQ2ehjSVsbO3b8MlSTATC1WuUFIaNc
         7CP8N1vcO30FFHfB7tSI8Ad0YWao7xoc9DrNiZBE0Vb4iuGSJyk3ihF7hLXG3p7Ma/+n
         5SmzME/4xYX4A7aVplcKmm/o+HlHmccAfm9A6k7945F+mgORJsneFQMJeRpEyoFrR9nR
         tPEVgyvdNXALkb2a2rv/phoDs1wqUxelFW4Us56BHbZQ0MLO81mmANdMAyqmwxeh2cER
         WkIg==
X-Forwarded-Encrypted: i=1; AJvYcCWwtx2hLEzwC4W0/FY09mEPVsnz3TDkPyLq0sO39FR7fiEeSuxR+enjjEcRqKWyEeSIMm13ueRg3A52FQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyXrPgpwEbldvKxwdSH7v5JB01N6qKkFIO/LM/jmsvHLywvv3oF
	DsVp7iJlTYUV1nSOYiBlyh8r/Ro9OrsOZ1W/jYz+jrn0EKD7arLICWPr
X-Gm-Gg: ASbGncuq9C4RfcL/nk3SUolNsbBxwCS4aTNm0x8U5da0zSKzBssgtvc/wkgOvHv3A5d
	geNZ3v8f217GKi/8ksA5OyXboLUqKjd7fan2Qp4OupPUKcBdMkYNTnDZLkVRcK+I6QqXlVzGmsi
	Lud31vGOZ/wX6T1EYFoH1uaINl1bNmTznG61rl5measo1HTLHmNRoG1pF2Ovf5sCEVEbNcxjKYG
	bkXqfCerdvzUaB2tBJBtftBTX1a1VoDPza/3pG1wkgzi2TUTdH5md4FyI3jyg+faLfFiJuiOrpd
	ze7xgSg/8GGGsNWiUInOYyEg4UTr65UM5E2c0qq+I/4VkPi9+xeT/aLMRqXihHodYVYAY7WIopT
	5iLvB6NdH1LOkNQbJYx4WF7JOVhjQ+q7M4IGyKz6sRwo2XV6lwcUzhAGmR+WpY4b/2w0/ZeizMU
	8DKiPKTHqGZGqqw9tWyfdTwKEF
X-Google-Smtp-Source: AGHT+IFOjeQ0nHa/gitKNf1wf8IwI8ZEjtO1qVKyyQQ31rBE2Lfq+ONwSrRkJugnArpqn7KBTPKjcA==
X-Received: by 2002:a05:6a00:114f:b0:7a4:f552:b524 with SMTP id d2e1a72fcca58-7ca8b2b16e0mr9121834b3a.28.1764206105589;
        Wed, 26 Nov 2025 17:15:05 -0800 (PST)
Received: from Barrys-MBP.hub ([47.72.129.29])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7c414c226f9sm22447356b3a.53.2025.11.26.17.14.44
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 26 Nov 2025 17:15:04 -0800 (PST)
From: Barry Song <21cnbao@gmail.com>
To: akpm@linux-foundation.org,
	linux-mm@kvack.org
Cc: Barry Song <v-songbaohua@oppo.com>,
	Russell King <linux@armlinux.org.uk>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
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
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	"Liam R . Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
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
Subject: [RFC PATCH 0/2] mm: continue using per-VMA lock when retrying page faults after I/O
Date: Thu, 27 Nov 2025 09:14:36 +0800
Message-Id: <20251127011438.6918-1-21cnbao@gmail.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251126_171507_076631_E1D50E2C 
X-CRM114-Status: GOOD (  11.86  )
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

RnJvbTogQmFycnkgU29uZyA8di1zb25nYmFvaHVhQG9wcG8uY29tPgoKT3ZlbiBvYnNlcnZlZCBt
b3N0IG1tYXBfbG9jayBjb250ZW50aW9uIGFuZCBwcmlvcml0eSBpbnZlcnNpb24KY29tZSBmcm9t
IHBhZ2UgZmF1bHQgcmV0cmllcyBhZnRlciB3YWl0aW5nIGZvciBJL08gY29tcGxldGlvbi4KT3Zl
biBzdWJzZXF1ZW50bHkgcmFpc2VkIHRoZSBmb2xsb3dpbmcgaWRlYToKClRoZXJlIGlzIG5vIG5l
ZWQgdG8gYWx3YXlzIGZhbGwgYmFjayB0byBtbWFwX2xvY2sgaWYgdGhlIHBlci1WTUEKbG9jayB3
YXMgcmVsZWFzZWQgb25seSB0byB3YWl0IGZvciBwYWdlY2FjaGUgb3Igc3dhcGNhY2hlIHRvCmJl
Y29tZSByZWFkeS4KCkluIHRoaXMgY2FzZSwgdGhlIHJldHJ5IHBhdGggY2FuIGNvbnRpbnVlIHVz
aW5nIHRoZSBwZXItVk1BIGxvY2suClRoaXMgaXMgYSBiaWcgd2luOiBpdCBncmVhdGx5IHJlZHVj
ZXMgbW1hcF9sb2NrIGFjcXVpc2l0aW9ucy4KCk92ZW4gTGl5YW5nICgxKToKICBtbS9maWxlbWFw
OiBSZXRyeSBmYXVsdCBieSBWTUEgbG9jayBpZiB0aGUgbG9jayB3YXMgcmVsZWFzZWQgZm9yIEkv
TwoKQmFycnkgU29uZyAoMSk6CiAgbW0vc3dhcGluOiBSZXRyeSBzd2FwaW4gYnkgVk1BIGxvY2sg
aWYgdGhlIGxvY2sgd2FzIHJlbGVhc2VkIGZvciBJL08KCiBhcmNoL2FybS9tbS9mYXVsdC5jICAg
ICAgIHwgIDUgKysrKysKIGFyY2gvYXJtNjQvbW0vZmF1bHQuYyAgICAgfCAgNSArKysrKwogYXJj
aC9sb29uZ2FyY2gvbW0vZmF1bHQuYyB8ICA0ICsrKysKIGFyY2gvcG93ZXJwYy9tbS9mYXVsdC5j
ICAgfCAgNSArKysrLQogYXJjaC9yaXNjdi9tbS9mYXVsdC5jICAgICB8ICA0ICsrKysKIGFyY2gv
czM5MC9tbS9mYXVsdC5jICAgICAgfCAgNCArKysrCiBhcmNoL3g4Ni9tbS9mYXVsdC5jICAgICAg
IHwgIDQgKysrKwogaW5jbHVkZS9saW51eC9tbV90eXBlcy5oICB8ICA5ICsrKysrLS0tLQogbW0v
ZmlsZW1hcC5jICAgICAgICAgICAgICB8ICA1ICsrKystCiBtbS9tZW1vcnkuYyAgICAgICAgICAg
ICAgIHwgMTAgKysrKysrKystLQogMTAgZmlsZXMgY2hhbmdlZCwgNDcgaW5zZXJ0aW9ucygrKSwg
OCBkZWxldGlvbnMoLSkKCkNjOiBSdXNzZWxsIEtpbmcgPGxpbnV4QGFybWxpbnV4Lm9yZy51az4K
Q2M6IENhdGFsaW4gTWFyaW5hcyA8Y2F0YWxpbi5tYXJpbmFzQGFybS5jb20+CkNjOiBXaWxsIERl
YWNvbiA8d2lsbEBrZXJuZWwub3JnPgpDYzogSHVhY2FpIENoZW4gPGNoZW5odWFjYWlAa2VybmVs
Lm9yZz4KQ2M6IFdBTkcgWHVlcnVpIDxrZXJuZWxAeGVuMG4ubmFtZT4KQ2M6IE1hZGhhdmFuIFNy
aW5pdmFzYW4gPG1hZGR5QGxpbnV4LmlibS5jb20+CkNjOiBNaWNoYWVsIEVsbGVybWFuIDxtcGVA
ZWxsZXJtYW4uaWQuYXU+CkNjOiBOaWNob2xhcyBQaWdnaW4gPG5waWdnaW5AZ21haWwuY29tPgpD
YzogQ2hyaXN0b3BoZSBMZXJveSA8Y2hyaXN0b3BoZS5sZXJveUBjc2dyb3VwLmV1PgpDYzogUGF1
bCBXYWxtc2xleSA8cGp3QGtlcm5lbC5vcmc+CkNjOiBQYWxtZXIgRGFiYmVsdCA8cGFsbWVyQGRh
YmJlbHQuY29tPgpDYzogQWxiZXJ0IE91IDxhb3VAZWVjcy5iZXJrZWxleS5lZHU+CkNjOiBBbGV4
YW5kcmUgR2hpdGkgPGFsZXhAZ2hpdGkuZnI+CkNjOiBBbGV4YW5kZXIgR29yZGVldiA8YWdvcmRl
ZXZAbGludXguaWJtLmNvbT4KQ2M6IEdlcmFsZCBTY2hhZWZlciA8Z2VyYWxkLnNjaGFlZmVyQGxp
bnV4LmlibS5jb20+CkNjOiBIZWlrbyBDYXJzdGVucyA8aGNhQGxpbnV4LmlibS5jb20+CkNjOiBW
YXNpbHkgR29yYmlrIDxnb3JAbGludXguaWJtLmNvbT4KQ2M6IENocmlzdGlhbiBCb3JudHJhZWdl
ciA8Ym9ybnRyYWVnZXJAbGludXguaWJtLmNvbT4KQ2M6IFN2ZW4gU2NobmVsbGUgPHN2ZW5zQGxp
bnV4LmlibS5jb20+CkNjOiBEYXZlIEhhbnNlbiA8ZGF2ZS5oYW5zZW5AbGludXguaW50ZWwuY29t
PgpDYzogQW5keSBMdXRvbWlyc2tpIDxsdXRvQGtlcm5lbC5vcmc+CkNjOiBQZXRlciBaaWpsc3Ry
YSA8cGV0ZXJ6QGluZnJhZGVhZC5vcmc+CkNjOiBUaG9tYXMgR2xlaXhuZXIgPHRnbHhAbGludXRy
b25peC5kZT4KQ2M6IEluZ28gTW9sbmFyIDxtaW5nb0ByZWRoYXQuY29tPgpDYzogQm9yaXNsYXYg
UGV0a292IDxicEBhbGllbjguZGU+CkNjOiB4ODZAa2VybmVsLm9yZwpDYzogSC4gUGV0ZXIgQW52
aW4gPGhwYUB6eXRvci5jb20+CkNjOiBEYXZpZCBIaWxkZW5icmFuZCA8ZGF2aWRAa2VybmVsLm9y
Zz4KQ2M6IExvcmVuem8gU3RvYWtlcyA8bG9yZW56by5zdG9ha2VzQG9yYWNsZS5jb20+CkNjOiBM
aWFtIFIuIEhvd2xldHQgPExpYW0uSG93bGV0dEBvcmFjbGUuY29tPgpDYzogVmxhc3RpbWlsIEJh
YmthIDx2YmFia2FAc3VzZS5jej4KQ2M6IE1pa2UgUmFwb3BvcnQgPHJwcHRAa2VybmVsLm9yZz4K
Q2M6IFN1cmVuIEJhZ2hkYXNhcnlhbiA8c3VyZW5iQGdvb2dsZS5jb20+CkNjOiBNaWNoYWwgSG9j
a28gPG1ob2Nrb0BzdXNlLmNvbT4KQ2M6IE1hdHRoZXcgV2lsY294IDx3aWxseUBpbmZyYWRlYWQu
b3JnPgpDYzogUGVkcm8gRmFsY2F0byA8cGZhbGNhdG9Ac3VzZS5kZT4KQ2M6IEphcmtrbyBTYWtr
aW5lbiA8amFya2tvQGtlcm5lbC5vcmc+CkNjOiBPc2NhciBTYWx2YWRvciA8b3NhbHZhZG9yQHN1
c2UuZGU+CkNjOiBLdW5pbm9yaSBNb3JpbW90byA8a3VuaW5vcmkubW9yaW1vdG8uZ3hAcmVuZXNh
cy5jb20+CkNjOiBPdmVuIExpeWFuZyA8bGl5YW5nb3V3ZW4xQG9wcG8uY29tPgpDYzogTWFyayBS
dXRsYW5kIDxtYXJrLnJ1dGxhbmRAYXJtLmNvbT4KQ2M6IEFkYSBDb3VwcmllIERpYXogPGFkYS5j
b3VwcmllZGlhekBhcm0uY29tPgpDYzogUm9iaW4gTXVycGh5IDxyb2Jpbi5tdXJwaHlAYXJtLmNv
bT4KQ2M6IEtyaXN0aW5hIE1hcnTFoWVua28gPGtyaXN0aW5hLm1hcnRzZW5rb0Bhcm0uY29tPgpD
YzogS2V2aW4gQnJvZHNreSA8a2V2aW4uYnJvZHNreUBhcm0uY29tPgpDYzogWWVvcmV1bSBZdW4g
PHllb3JldW0ueXVuQGFybS5jb20+CkNjOiBXZW50YW8gR3VhbiA8Z3VhbndlbnRhb0B1bmlvbnRl
Y2guY29tPgpDYzogVGhvcnN0ZW4gQmx1bSA8dGhvcnN0ZW4uYmx1bUBsaW51eC5kZXY+CkNjOiBT
dGV2ZW4gUm9zdGVkdCA8cm9zdGVkdEBnb29kbWlzLm9yZz4KQ2M6IFl1bmh1aSBDdWkgPGN1aXl1
bmh1aUBieXRlZGFuY2UuY29tPgpDYzogTmFtIENhbyA8bmFtY2FvQGxpbnV0cm9uaXguZGU+CkNj
OiBDaHJpcyBMaSA8Y2hyaXNsQGtlcm5lbC5vcmc+CkNjOiBLYWlydWkgU29uZyA8a2Fzb25nQHRl
bmNlbnQuY29tPgpDYzogS2VtZW5nIFNoaSA8c2hpa2VtZW5nQGh1YXdlaWNsb3VkLmNvbT4KQ2M6
IE5oYXQgUGhhbSA8bnBoYW1jc0BnbWFpbC5jb20+CkNjOiBCYW9xdWFuIEhlIDxiaGVAcmVkaGF0
LmNvbT4KQ2M6IGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZwpDYzogbGludXgt
a2VybmVsQHZnZXIua2VybmVsLm9yZwpDYzogbG9vbmdhcmNoQGxpc3RzLmxpbnV4LmRldgpDYzog
bGludXhwcGMtZGV2QGxpc3RzLm96bGFicy5vcmcKQ2M6IGxpbnV4LXJpc2N2QGxpc3RzLmluZnJh
ZGVhZC5vcmcKQ2M6IGxpbnV4LXMzOTBAdmdlci5rZXJuZWwub3JnCkNjOiBsaW51eC1tbUBrdmFj
ay5vcmcKQ2M6IGxpbnV4LWZzZGV2ZWxAdmdlci5rZXJuZWwub3JnCgotLSAKMi4zOS4zIChBcHBs
ZSBHaXQtMTQ2KQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlz
Y3YK
