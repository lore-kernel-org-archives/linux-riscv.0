Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 828E0D49797
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Dec 2024 09:33:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=7kIGyJcdnxOOA4UlzYUyprKJc8XX81jHJbLKxkxDiAQ=; b=kT+/jxRcsvawP1
	4Z+FvX/j7+PPzDxw4QIMiK8mJs/LamOdEYmFJKK+4WuD1MSGUujvRwGRILCt/c0Rd0jX/rCJazFPM
	ZCDB/0jqCcvnD2zjQ+sx1tEW6R74VC72ULAGWAFz/rRSl0avc30DVCPItsNyqK7u6Bd5USBCR5xf1
	nGv5ciZasd4t5NM6A+mjxaWtOJXUbjbGWZP73Unumc7JkTcnhuAtzk2+WsoiIzdvssJjVROFKnYrR
	kKZrVjeYF5qfUNUWHTYpmeZ3WkcLmwsyCI8edL+rj9hRlZMZ8jAEOqaxQ64IWkdmQscSXsE4UBAYB
	+7KE4EMjEOwRIzBRvVgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIPHf-00000008teO-2X7U;
	Tue, 03 Dec 2024 09:33:31 +0000
Received: from flow-b2-smtp.messagingengine.com ([202.12.124.137])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIPFF-00000008t2z-0686
	for linux-riscv@lists.infradead.org;
	Tue, 03 Dec 2024 09:31:05 +0000
Received: from phl-compute-04.internal (phl-compute-04.phl.internal [10.202.2.44])
	by mailflow.stl.internal (Postfix) with ESMTP id 18D5D1D40988;
	Tue,  3 Dec 2024 04:30:57 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Tue, 03 Dec 2024 04:30:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	coelacanthus.name; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:message-id:mime-version:reply-to:subject:subject:to:to; s=fm2;
	 t=1733218256; x=1733221856; bh=9Whz9OzImmI197gBlbvEhE00BE9mdgVf
	ySVnOACTR9Y=; b=RNJplb1yrN00f7zdFJdcu6N7y5hK1UMRnFRIDc4o6KCa4+De
	ORA2IlbnFsh7hdJRe3sFZRhKsdNYK0MNGJFsxumrcH3SE3XbqiVxannw8oZnL0c/
	WHviJmqp7NY82KIdRTJ3mqeqtmdXUmsbvQvQx9RjNeQa9oBPg4XHU/V7OiIPSg8H
	DAfdYqL+mxVovbI+6ey0r1YTWN68weWPbpCcJzQ2JGRw6s/PY2NdVOJb3fipkg9o
	7jRPs0GlHN6VvOjddBgoEsnf1pG58asUhLX0xZqQh2roThopvhFGA38Gy3eB+li0
	zgCsdlirWllX/N3UvsYnz9IynuGK5SmC3KeiJA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1733218256; x=1733221856; bh=9Whz9OzImmI197gBlbvEhE00BE9m
	dgVfySVnOACTR9Y=; b=ep3/xxhN56CEHoJQrzbZHejN1asBPwqo7/vdAJjsxVRv
	xFpCJBpkaYWoz69zOkIRVLQ210jLUh9Gsyo/lsPDaWgD7HrM7U36B+kYKv/+0qmP
	sinTW5YCqO8Z8kuohlWdYzob9fqazOKhlvbqoTuD9FLemzdvhUB6TCeVTmMTKC2j
	EYFViZFZ0D83aheL/4b7giDv6A/inHSGdbztRBPbO1Hwa0iY+zmkoBZzI6eTZ6Fi
	6gIGip7jV4/B0hjelDhAq+bV8wS0EVhlWiTcUgq9t0fym5vcqJfoN/cuKM/nR8O5
	37ujKRya7M/LsrIcr6AfQ3foVBjJEEShJMpNbJvf8A==
X-ME-Sender: <xms:zc9OZ90xpeteE_hY16-W3ByxLs9wco_EGSUkaSV8I3YIJKZim75P9w>
    <xme:zc9OZ0Hl1KV3lBxqwY9PqVUYfHdgyqn7kMYlaZFM40N3h46H9uyT7X0-4nwRv32SG
    2T2gz613wZL5dwDEiw>
X-ME-Received: <xmr:zc9OZ95a6o7_TcMJPg8mo5D4Yt1YJbO0Rx5XIudTYudBxBsOkZRXWa2u3RMOCw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddriedvgddthecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdpuffr
    tefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnth
    hsucdlqddutddtmdenucfjughrpefhufffkfggtgfgvfevofesthejredtredtjeenucfh
    rhhomhepvegvlhgvshhtvgcunfhiuhcuoehufihusegtohgvlhgrtggrnhhthhhushdrnh
    grmhgvqeenucggtffrrghtthgvrhhnpeduveelffdvkeekkedvgeeugfdutdekteeuudfh
    leffhffhffeihfetjefhleehueenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuve
    hluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepuhifuhestgho
    vghlrggtrghnthhhuhhsrdhnrghmvgdpnhgspghrtghpthhtohepvdejpdhmohguvgepsh
    hmthhpohhuthdprhgtphhtthhopehufihusegtohgvlhgrtggrnhhthhhushdrnhgrmhgv
    pdhrtghpthhtohepshhtrggslhgvsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpth
    htohepshhhuhgrhheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepphgruhhlrdifrghl
    mhhslhgvhiesshhifhhivhgvrdgtohhmpdhrtghpthhtohepghhuohhrvghnsehkvghrnh
    gvlhdrohhrghdprhgtphhtthhopehkvggvsheskhgvrhhnvghlrdhorhhgpdhrtghpthht
    ohepiihihigrohesughishhrohhothdrohhrghdprhgtphhtthhopehlihhnuhigqdhksh
    gvlhhfthgvshhtsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhguvhes
    shhtrhgrtggvrdhioh
X-ME-Proxy: <xmx:zc9OZ62Q9_RVpr9UReo8VK9HZLHaSnOWWl5lXLbg2bniUpu9OCwjog>
    <xmx:zc9OZwHMI1vHVnWtFO5ACJjizWuM9d_z5UxXdmF7ug0mcDoBc_dQBQ>
    <xmx:zc9OZ79eWWeaKPnQDQzr34y_Op-wE6uAvbAnWqc8S_vu3xpFqGa3qw>
    <xmx:zc9OZ9mC3rhFgNhp0oLV_JAUEcnGq0GwFNemt54juzHUulkN480rew>
    <xmx:0M9OZwUEnubuc9QGHm8_txPbk40pvTI1l3D5IixhIfiMpCosaBwOVzOU>
Feedback-ID: i95c648bc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 3 Dec 2024 04:30:52 -0500 (EST)
From: Celeste Liu <uwu@coelacanthus.name>
Subject: [PATCH v2 0/2] riscv/ptrace: add new regset to access original a0
 register
Date: Tue, 03 Dec 2024 17:30:03 +0800
Message-Id: <20241203-riscv-new-regset-v2-0-d37da8c0cba6@coelacanthus.name>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAJvPTmcC/32NQQ6CMBBFr0Jm7RhaJYIr72FYlOkIk2ghHawaw
 t2tHMDle8l/fwHlKKxwLhaInERlDBnsrgAaXOgZxWcGW9qjsaXBKEoJA78wcq88o69s0zWVdb7
 0kGdT5Ju8t+S1zTyIzmP8bA/J/OyfWDJokOoDVbXriE7dhUa+O3JhHp66D+7B0K7r+gVGqTKju
 AAAAA==
X-Change-ID: 20241201-riscv-new-regset-d529b952ad0d
To: Oleg Nesterov <oleg@redhat.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Eric Biederman <ebiederm@xmission.com>, Kees Cook <kees@kernel.org>, 
 Shuah Khan <shuah@kernel.org>
Cc: Alexandre Ghiti <alex@ghiti.fr>, "Dmitry V. Levin" <ldv@strace.io>, 
 Andrea Bolognani <abologna@redhat.com>, 
 =?utf-8?q?Bj=C3=B6rn_T=C3=B6pel?= <bjorn@kernel.org>, 
 Thomas Gleixner <tglx@linutronix.de>, Ron Economos <re@w6rz.net>, 
 Charlie Jenkins <charlie@rivosinc.com>, Quan Zhou <zhouquan@iscas.ac.cn>, 
 Felix Yan <felixonmars@archlinux.org>, Ruizhe Pan <c141028@gmail.com>, 
 Shiqi Zhang <shiqi@isrc.iscas.ac.cn>, Guo Ren <guoren@kernel.org>, 
 Yao Zi <ziyao@disroot.org>, Han Gao <gaohan@iscas.ac.cn>, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-mm@kvack.org, stable@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Celeste Liu <uwu@coelacanthus.name>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1306; i=uwu@coelacanthus.name;
 h=from:subject:message-id; bh=v3UR4n3upO1L3GtOj7I7EX/ml6xx42eddSbkQxGVPzA=;
 b=owJ4nJvAy8zAJeafov85RWVtBeNptSSGdL/zR1nEExOVj0Udc7NZ5BrYLlLjpzZj4c9vS5aL8
 CVtijVnm9tRysIgxsUgK6bIklfC8pPz0tnuvR3bu2DmsDKBDGHg4hSAiSSIMvz3nbjSK/59vqDt
 hI11mxh7W2f3MOr1rPQN5Hv9YYLhv9p6hv9OIfuPB6UvXO9h3JgQERqzOq7qhWqKfPzcnctKbxr
 0dbEDAJu6Rqg=
X-Developer-Key: i=uwu@coelacanthus.name; a=openpgp;
 fpr=892EBC7DC392DFF9C9C03F1D15F4180E73787863
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241203_013101_579112_992D35B5 
X-CRM114-Status: UNSURE (   7.53  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

The orig_a0 is missing in struct user_regs_struct of riscv, and there is
no way to add it without breaking UAPI. (See Link tag below)

Like NT_ARM_SYSTEM_CALL do, we add a new regset name NT_RISCV_ORIG_A0 to
access original a0 register from userspace via ptrace API.

Link: https://lore.kernel.org/all/59505464-c84a-403d-972f-d4b2055eeaac@gmail.com/

Signed-off-by: Celeste Liu <uwu@coelacanthus.name>
---
Changes in v2:
- Fix integer width.
- Add selftest.
- Link to v1: https://lore.kernel.org/r/20241201-riscv-new-regset-v1-1-c83c58abcc7b@coelacanthus.name

---
Celeste Liu (1):
      riscv/ptrace: add new regset to access original a0 register

Charlie Jenkins (1):
      riscv: selftests: Add a ptrace test to verify syscall parameter modification

 arch/riscv/kernel/ptrace.c                   |  32 +++++++
 include/uapi/linux/elf.h                     |   1 +
 tools/testing/selftests/riscv/abi/.gitignore |   1 +
 tools/testing/selftests/riscv/abi/Makefile   |   5 +-
 tools/testing/selftests/riscv/abi/ptrace.c   | 134 +++++++++++++++++++++++++++
 5 files changed, 172 insertions(+), 1 deletion(-)
---
base-commit: 0e287d31b62bb53ad81d5e59778384a40f8b6f56
change-id: 20241201-riscv-new-regset-d529b952ad0d

Best regards,
-- 
Celeste Liu <uwu@coelacanthus.name>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
