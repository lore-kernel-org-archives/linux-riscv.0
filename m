Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9200CC44516
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Jul 2026 12:44:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:From:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uOcGm99gSYtvUE00Hw/qxqkpxvv9a3VrofYnHXkHqdw=; b=qGhubznOPOOOC2
	8Ax9tnSOf+qirnluze7jSlEIOxRF3q2s9GSu/wxo1AJH3uM57JeXwvBm8HUxcNh7fuxdMR2JjxOd+
	YlrVb4VWHHHrxbPVhJcXTc/SAU5c6+7uC0P79tyl5X6KHHXC2NtG0Fy/Frt7aTrkuYgfpZHG5zlrN
	wS0lrtqIlK5hSg6zxePjm6uu9PZF5MovJfDW4Zuw0j0QqYeaKBMkYCpVb1+ZVHnJKJwMKgs30KF5L
	D3Th7D50K7xEqMp1nPfoBUJRGFOmTQbcsfthaCVCJ97NiTVglHs9ocsvswcDcbL+6fPnXbW0wl8VH
	1UgRDIaNh+UTUAsNM51w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkhvM-00000002JyG-1viI;
	Fri, 17 Jul 2026 12:44:16 +0000
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkhvJ-00000002JxW-1NfZ
	for linux-riscv@lists.infradead.org;
	Fri, 17 Jul 2026 12:44:14 +0000
Received: from [192.168.0.104] (unknown [123.116.46.73])
	by APP-05 (Coremail) with SMTP id zQCowAA3aEKQI1pqDnIHAA--.9549S2;
	Fri, 17 Jul 2026 20:44:00 +0800 (CST)
Message-ID: <f584aa6e-3d7d-4ae2-80d6-e012815eda21@iscas.ac.cn>
Date: Fri, 17 Jul 2026 20:44:00 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/5] riscv: compat_vdso: Build with zacas if available
From: Vivian Wang <wangruikang@iscas.ac.cn>
To: Nam Cao <namcao@linutronix.de>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
 =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Thomas Gleixner <tglx@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>
References: <cover.1784274927.git.namcao@linutronix.de>
 <704e0bbacee5f23d1351a686f3a783e31699fb3b.1784274927.git.namcao@linutronix.de>
 <0e65ddab-f066-4d9a-b032-d1e55e76fe47@iscas.ac.cn>
Content-Language: en-US
In-Reply-To: <0e65ddab-f066-4d9a-b032-d1e55e76fe47@iscas.ac.cn>
X-CM-TRANSID: zQCowAA3aEKQI1pqDnIHAA--.9549S2
X-Coremail-Antispam: 1UD129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UjIYCTnIWjp_UUUY67k0a2IF6w4kM7kC6x804xWl14x267AK
	xVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wAFIxvE14AKwVWUJVWUGw
	A2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjxv20xvE14v26r4j
	6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j6r4UJwA2z4x0Y4vEx4A2jsIE14v26r
	xl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv
	0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUXVWUAwAv7VC2z2
	80aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JM4IIrI8v6xkF
	7I0E8cxan2IY04v7MxAIw28IcxkI7VAKI48JMxAqzxv26xkF7I0En4kS14v26r1q6r43Mx
	C20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAF
	wI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20x
	vE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v2
	0xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxV
	W8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU5fhL5UUUUU==
X-Originating-IP: [123.116.46.73]
X-CM-SenderInfo: pzdqw2pxlnt03j6l2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260717_054413_756563_11AA16B5 
X-CRM114-Status: UNSURE (   4.80  )
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

On 7/17/26 20:38, Vivian Wang wrote:

> Hi Nam,
> [...]
>
> I recently found out that we add and *only* add Zacas and Zabha to the

So ... okay, this is not strictly true, since we add F, D, V sometimes
as well, but those have their own state and need special handling so
it's not the same thing. And also they're only added for *some*
compilation units.

> global -march for kernel code, just for use in assembly code in
> arch/riscv/include/asm/cmpxchg.h.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
