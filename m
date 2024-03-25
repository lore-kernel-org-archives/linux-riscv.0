Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5056C54E58
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Mar 2024 23:50:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	Message-Id:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HUFPGTyUSpqD6AjmpTzbCokcmJU9HONpj4qBHaOzIt8=; b=j8xkJx/73L5dii
	5FqtzKTJyj2b4tOrf2Gv7SnaHWPiuClxUm7vl2zZHEHjDkIwA8lb5pw81NZupR9qjXTbYFGfDHBf4
	W8WDWfeM0SEACHE9sUivZhWZlloPB5KZhq7GKMFsGxiV29wyw3WmYtz5R+41oReT3iDmfi8k13DKe
	t6rkDGOY8TIMonVDeUwn1J4kbXgLH4YzAnrPS+uOixgn1uZjDSlbjjQW2ulu3Rm8uG2dj5n1vVy3r
	PF+7JTkpvh7G81Ys71xI35gV1mlzoWZL2PjyHH31chXXGhsb1XGslG/I9QX9dGW8BIBs3f8gTl67K
	n5Fhklw9ol58gYRkNW1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rou5Z-00000002PRL-3PRS;
	Mon, 25 Mar 2024 23:50:49 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rou5V-00000002POC-42te
	for linux-riscv@lists.infradead.org;
	Mon, 25 Mar 2024 23:50:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id A9E05CE1DCA;
	Mon, 25 Mar 2024 23:50:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3549C433F1;
	Mon, 25 Mar 2024 23:50:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711410642;
	bh=EQ0lNcHAsZM9AzkcfyMG2JMpCa+0V7NnfA1QWVnegz0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=KeRP34BKGe6jQH6sHSXzv3tQPiBBAiBgxtv6jJ5ahzUFHgORlz9ucYi5FAuAeANb3
	 fqwLhGm9JrkZE0xg3KsWmBMRyZhX9Lt82aFlMKuTP7DIXmhf64GWD1xFLHA0IZP5ox
	 DIY/farVYhuaroLBBAv1FHVack2kmO5PTS8CkgT2KvFsdCwh4tEev3QK3ctL15Pkeq
	 193osBE5rF6/BPy0txNZB+DYnsn0Z9yOfcd8BsAESuQb6Z7wPUQV6cjCYJDf2sTONc
	 nkZFMbL/Ig711iuw+2GH4A+7muzT36lFsAMoxkuJcVmlzxcjvyNpIXPv0CT7BYs5CP
	 AcGfmzt+9cwvg==
Date: Tue, 26 Mar 2024 08:50:37 +0900
From: Masami Hiramatsu (Google) <mhiramat@kernel.org>
To: "Jarkko Sakkinen" <jarkko@kernel.org>
Cc: <linux-riscv@lists.infradead.org>, "Masami Hiramatsu"
 <mhiramat@kernel.org>, "Paul Walmsley" <paul.walmsley@sifive.com>,
 "Palmer Dabbelt" <palmer@dabbelt.com>, "Albert Ou" <aou@eecs.berkeley.edu>,
 <linux-kernel@vger.kernel.org>, "Luis Chamberlain" <mcgrof@kernel.org>,
 <linux-modules@vger.kernel.org>, "Naveen N . Rao"
 <naveen.n.rao@linux.ibm.com>, "Anil S Keshavamurthy"
 <anil.s.keshavamurthy@intel.com>, "David S . Miller" <davem@davemloft.net>
Subject: Re: [PATCH v5 1/2] kprobes: textmem API
Message-Id: <20240326085037.0142d7dadc702e3b49a3251e@kernel.org>
In-Reply-To: <D036AJAEAOUF.34494O217N0RI@kernel.org>
References: <20240325215502.660-1-jarkko@kernel.org>
	<D036AJAEAOUF.34494O217N0RI@kernel.org>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240325_165046_238994_3049667C 
X-CRM114-Status: GOOD (  17.29  )
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

On Tue, 26 Mar 2024 00:09:42 +0200
"Jarkko Sakkinen" <jarkko@kernel.org> wrote:

> On Mon Mar 25, 2024 at 11:55 PM EET, Jarkko Sakkinen wrote:
> > +#ifdef CONFIG_MODULES
> >  	if (register_module_notifier(&trace_kprobe_module_nb))
> >  		return -EINVAL;
> > +#endif /* CONFIG_MODULES */
> 
> register_module_notifier() does have "dummy" version but what
> would I pass to it. It makes more mess than it cleans to declare
> also a "dummy" version of trace_kprobe_module_nb.

That is better than having #ifdef in the function.

> 
> The callback itself has too tight module subsystem bindings so
> that they could be simply flagged with IS_DEFINED() (or correct
> if I'm mistaken, this the conclusion I've ended up with).

Please try this.

-----
diff --git a/kernel/kprobes.c b/kernel/kprobes.c
index 70dc6179086e..bc98db14927f 100644
--- a/kernel/kprobes.c
+++ b/kernel/kprobes.c
@@ -2625,6 +2625,7 @@ static void remove_module_kprobe_blacklist(struct module *mod)
 	}
 }
 
+#ifdef CONFIG_MODULES
 /* Module notifier call back, checking kprobes on the module */
 static int kprobes_module_callback(struct notifier_block *nb,
 				   unsigned long val, void *data)
@@ -2675,6 +2676,9 @@ static int kprobes_module_callback(struct notifier_block *nb,
 	mutex_unlock(&kprobe_mutex);
 	return NOTIFY_DONE;
 }
+#else
+#define kprobes_module_callback	(NULL)
+#endif
 
 static struct notifier_block kprobe_module_nb = {
 	.notifier_call = kprobes_module_callback,
@@ -2739,7 +2743,7 @@ static int __init init_kprobes(void)
 	err = arch_init_kprobes();
 	if (!err)
 		err = register_die_notifier(&kprobe_exceptions_nb);
-	if (!err)
+	if (!err && IS_ENABLED(CONFIG_MODULES))
 		err = register_module_notifier(&kprobe_module_nb);
 
 	kprobes_initialized = (err == 0);

-----

Thank you,

-- 
Masami Hiramatsu (Google) <mhiramat@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
