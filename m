Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCB1C606A31C
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Nov 2026 07:46:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Y3AA7dgH;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HXfc0DEV
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Message-Id:MIME-Version:Subject:Date
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=dmG32PC5WuWosM4FNhW2q23fKrBYsOXBObrkaazf6is=; b=Y3AA7dgHNWcVkfH7DJk3OqTFMl
	B9PlGsMOH03vCneiIK4UuOwC2SeVc4Oix2Oj+LBBqa5C/QZSyUTgtX1G4Utog6akgzRYkeo9aOovN
	IgtOrWUY8GW3DBy7vhB1qKZeJpp4I+hac8r70UcvYMbBi7JHZu3dDKOou19RX/bJP4LbfUeYuFA6g
	OChLRYDWlPo53C6iAWlNQEIsaNyarNOhHELoiszwVUiNkj9MVsYz4pWhozA0FthWasjoF8Hbq4Hrv
	y0BUH/8w/0MRoiQi2n2FRs0kSUkq+nc3PrOL+FvRdFjW87Vzaa6LFR9OvvhfxVyauTjhcgKAuiGuO
	9UkzK6qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRPVL-00000008wuP-0vYq;
	Thu, 12 Nov 2026 07:45:55 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRPVJ-00000008wu4-1yrL
	for linux-riscv@lists.infradead.org;
	Thu, 12 Nov 2026 07:45:53 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 8339A61608;
	Thu, 12 Nov 2026 07:45:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D7231F00A05;
	Thu, 12 Nov 2026 07:45:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794469552;
	bh=IKKC/UM4m3qaxcA+tytyNl/vCPkOElZC3udRKzR6ZA4=;
	h=From:Date:Subject:To:Cc;
	b=HXfc0DEVWKfH6VyNWACNMJn9Gor/zzB9+VjvpAasAU4qUw/qcCh84P5WA9gVLqKWV
	 +uroVi0brDy7u7r7yMo9UnNBDiGhZgVXt4vhE/EOVfR/3vxCrOdMFqNX6LkYYQqo2/
	 qSNBZoFdh3GLCWHanNyaLB6JvQ+bpzs8dWIhimqOsVj5vMph6LrDtFujWYaiMbD0jD
	 85gd//NB9j/Ospi6KccfkGzQCU50GeDgo9HRS2yj8t1QiNNfnFuSOAv22x/OkptWT/
	 STzOj7bTWumh/8WWZbHgJlBEwjPCj4ZPxmIExkKsh/ohLZnwH90OKPTruHmp2XtpF3
	 tDzCkb/87CnDg==
From: Yixun Lan <dlan@kernel.org>
Date: Thu, 12 Nov 2026 07:45:43 +0000
Subject: [PATCH] pmdomain: core: connect consumer with supplier via device
 link
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261112-01-pm-device-link-v1-1-8932e0862378@kernel.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQqDMBCF4avIrDuQCSqkVyldaDLR0TaVREUQ7
 26syw/e+3dIHIUTPIsdIq+S5Bcy6FGA7ZvQMYrLBq10TUQaFeH0RZenlvEjYUTjnVOeK9OUBvJ
 viuxl+zdf79tpaQe28xWC4zgBE5L2HnUAAAA=
X-Change-ID: 20261112-01-pm-device-link-9fdd0fe59a49
To: Ulf Hansson <ulfh@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5218; i=dlan@kernel.org;
 h=from:subject:message-id; bh=rCIzxjBGzLtWtA/9HuxoKy2Z3j8sZKgmeE7iPstfpdY=;
 b=owEB6QIW/ZANAwAKATGq6kdZTbvtAcsmYgBq9W6q20YqcaI2cKi+EUxMpYAxUUj1aqNY5HHt9
 ekY0IzYDqiJAq8EAAEKAJkWIQS1urjJwxtxFWcCI9wxqupHWU277QUCavVuqhsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDJfFIAAAAAALgAoaXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5
 maWZ0aGhvcnNlbWFuLm5ldEI1QkFCOEM5QzMxQjcxMTU2NzAyMjNEQzMxQUFFQTQ3NTk0REJCRU
 QACgkQMarqR1lNu+3E/w/+KpA3MUqhFe9/TlB+f3FW1Yn75TK5DzrNAzbFHwqqZ8KwhEBoAuAe/
 42J+ZaAunZXVbhEh4rRrppVozgWC74G30uUaoHfAORvQq9dYtwHFQTu8kZSH18zrxLkTEx/tpOq
 lcGSrmw0G6eX4sbkfG/H5xTAvniqk2e60uDxTB00hDQ1AeekjW33JWCs8IPbYcqFn1DkxB57K1j
 FOUGugg8FGTvmtPaPIPGdKzEFM28X7la3SijJtBGz5jjefKeJMD4V3dW7BqIoX3l53srPSHtO6C
 n6BuDG5i3BwCOvoB27WYOlsOM8ftHEZhAG/X7YaYSoCESIf/PfP9ztjcwUyDgwTOYCtcJjpN+WW
 7UjTp1rP/YEo3h9J3NwvrgfLihw1ijUdt/DFrqkEIonEgxNK4cTBMbm+LRNY5/uL8lSH8xVGAc8
 DpR4I/VnZXfx57GjLvaRyIHDdYbAIbj/fztaKUcFcO1F0AR/YcNtNREEeN3JQgC8SshJqtuCvKn
 tN2vH8OIkIEC37FZw8gORV6W7pdtdMSxaJ3g60nCm7DRiDVW6PgseOe3lzQPhitxUXjH+xPz+rU
 U5FowduMY3UkhPLeAuZPEMPNKPV0k72X2P/AQmP8GcmRrwR5xeJAolLO46PF7u3UPBCywndjVuo
 yseDsBi9ykxxEagT5oYV63KUnl1IA0=
X-Developer-Key: i=dlan@kernel.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, Yixun Lan <dlan@kernel.org>, linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Connect downstream Power Domain consumer with the supplier through
the device link API, So when the pmdomain driver is unloaded or unbinded,
the consumer can be automatically notified and purged gracefully.

Signed-off-by: Yixun Lan <dlan@kernel.org>
---
The power domain drivers under pmdomain subystem suffer fom
the problem that unable to notify the downstream consumer with
module unload or unlink event, left with stale sysfs interface.
 Curently, the solution is a) use builtin_platform_driver() API
to disable the module unloading b) adding suppress_bind_attrs flag
to disable the unlink interface, which prevent it from being 
triggered from user space.

Take spacemit K3 platform [1] for example, without this patch,
Removing spacemit_pm_domains module will trigger a failure to
remove power domain, access pm_genpd_summary will result an
kernel oops, See detail log below

domain                          status          children        performance
    /device                         runtime status                  managed by
------------------------------------------------------------------------------
lcd1                            on                              0
    cac88000.dp                     unsupported                 0           SW
lcd0                            off-0                           0
audio                           on                              0
gpu                             on                              0
    cac00000.gpu                    active                      0           SW
vpu                             off-0                           0

gpu  lcd1  pm_genpd_summary

(gpu and lcd1 isn't clean up)

[  181.353671] spacemit_pm_domains spacemit_ccu.k3-apmu-pmdomain.3: failed to remove domain gpu: -16 - state may be inconsistent
[  181.353889] PM: genpd_remove: unable to remove lcd1
[  181.353896] spacemit_pm_domains spacemit_ccu.k3-apmu-pmdomain.3: failed to remove domain lcd1: -16 - state may be inconsistent

[  206.228045] CPU: 5 UID: 0 PID: 2560 Comm: cat Not tainted 7.3.0-rc12 #81 PREEMPTLAZY
[  206.238002] Hardware name: SpacemiT K3 Pico-ITX (DT)
[  206.243027] epc : summary_show+0xaa/0x308
[  206.247081]  ra : summary_show+0x264/0x308
[  206.251224] epc : ffffffff809f50fa ra : ffffffff809f52b4 sp : ffffffc601273a80
[  206.258542]  gp : ffffffff82333b98 tp : ffffffd601d5ec80 t0 : ffffffff80026b38
[  206.265859]  t1 : ffffffd6092d3cb0 t2 : ffffffff81601810 s0 : ffffffc601273b10
[  206.273177]  s1 : ffffffd601b92470 a0 : ffffffd601b92588 a1 : 000000000000000a
[  206.280494]  a2 : ffffffd609ae8000 a3 : 0000000000000000 a4 : ffffffd601d5ec80
[  206.287811]  a5 : 0000000000000000 a6 : ffffffffffffe000 a7 : 0000000000000000
[  206.295128]  s2 : ffffffd6092d3cb0 s3 : ffffffd601b92470 s4 : ffffffd601b94040
[  206.302447]  s5 : 0000000000000000 s6 : 0000000000000003 s7 : ffffffff8221e3a8
[  206.309764]  s8 : 0000000000000001 s9 : ffffffff8172b8c8 s10: 0000000000000004
[  206.317082]  s11: 0000000000000000 t3 : 000000000000017a t4 : 0000000000000002
[  206.324399]  t5 : 0000000000000000 t6 : ffffffd609ae7178 ssp : 0000000000000000
[  206.331804] status: 0000000200000120 badaddr: 0000000000000010 cause: 000000000000000d
[  206.339829] [<ffffffff809f50fa>] summary_show+0xaa/0x308
[  206.345206] [<ffffffff804b67f8>] seq_read_iter+0xe0/0x390
[  206.350671] [<ffffffff804b6b86>] seq_read+0xde/0x158
[  206.355697] [<ffffffff8063dee4>] full_proxy_read+0x54/0x88
[  206.361250] [<ffffffff8047a03e>] vfs_read+0xae/0x380
[  206.366275] [<ffffffff8047adc2>] ksys_read+0x6a/0xf0
[  206.371301] [<ffffffff8047ae68>] __riscv_sys_read+0x20/0x30
[  206.376944] [<ffffffff8101fa6a>] do_trap_ecall_u+0x19a/0x518
[  206.382674] [<ffffffff81033acc>] handle_exception+0x16c/0x178
[  206.388503] Code: 0a13 c00a 4c05 4b0d 3783 540a 3823 f804 3423 f804 (6b9c) 8552
[  206.396050] ---[ end trace 0000000000000000 ]---
Segmentation fault         cat /sys/kernel/debug/pm_genpd/pm_genpd_summary

====================================================================================

With this patch applied, either unload the module or trigger an
unbind operation, the downstream gpu, lcd1 will exit gracefully

or

domain                          status          children        performance
    /device                         runtime status                  managed by
------------------------------------------------------------------------------

Link: https://patch.msgid.link/20261108-04-k3-pm-support-v3-0-b9dc0857039b@kernel.org [1]
---
 drivers/pmdomain/core.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/pmdomain/core.c b/drivers/pmdomain/core.c
index 964e44c2f78f..870fc8083bca 100644
--- a/drivers/pmdomain/core.c
+++ b/drivers/pmdomain/core.c
@@ -3543,6 +3543,8 @@ static int __genpd_dev_pm_attach(struct device *dev, struct device *base_dev,
 		return -EPROBE_DEFER;
 	}
 
+	device_link_add(dev, &pd->dev, DL_FLAG_AUTOREMOVE_CONSUMER);
+
 	return 1;
 
 err:

---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261112-01-pm-device-link-9fdd0fe59a49

Best regards,
--  
Yixun Lan <dlan@kernel.org>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
