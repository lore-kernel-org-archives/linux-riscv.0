Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B2CFC4332F
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Oct 2022 19:48:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:Date:Message-Id
	:Subject:References:In-Reply-To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/3vuodm4y8hrdx5U33IKVXTzIeNvfBJmzo8MTDHk0T0=; b=3khE68fm3DOd2H
	0WKlww0gCreEbk1+ag3g7SoH0z+zoQUPkvVjWSYNHnFAkpOabEMbBryxoWoF0ZWXtGDz2ZTYm7FGF
	kSamxnFIBxCPqy7gDehU2iD4t+JRxAVvV/DnSIn1r2IFh7rdIrSZiUwdZ8DoNEzdYC+wGrysBHlga
	aY0dX/nzOZvdMqfkA3aILPedX64sR6KrvmR9MktRynnIG0ixwup4XPH0YtX5RHjgWFMDbc7g5gjrq
	JC4RrJgjKlaTNrewh+Ulnsft89ciozXQXpEwv0lf8o2y7x0/Vf7lQKXABo3ODh9pXJv2xi3LqDSYg
	5Zw/h0O8ZMwUO8xEBFGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oj4Bn-00Crgr-Uz; Thu, 13 Oct 2022 19:48:19 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oj4Bj-00Crdi-HK
	for linux-riscv@lists.infradead.org; Thu, 13 Oct 2022 19:48:17 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d24so2761148pls.4
        for <linux-riscv@lists.infradead.org>; Thu, 13 Oct 2022 12:48:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=to:from:cc:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U3IcGLKOjvaTyzTUS9C/MMMRO8g7hgaBW9dEJGasaM8=;
        b=rVOUIkeBIqZYAtSSF4eFMOnnrKQe7YDrmDTPcNQ9kmafqVt16/Uv5D4VRyRLR0LHDa
         V+qVnwMJFrCMIJjVTzGVNGpnIncqjJd+TEBJWfnjCe7/gdyfcBM2I/LbPgzyjq8XP+5R
         WVCqz3b1aZbmVDjUF6cnItA4F1L6JQuw4bW7yOjYJ9Q2/EKVt92zwTLvS6jwu9u/d/Ij
         KousLwVqtMDBcWQ+3dhuWXj+AqkSqwclT0JcNnet/WqPnFs9GOFfaFVyCy1ODqkOH0T5
         wMKZFiuSQUWYfIsIMq6KHrRmtnWJvTSNXfw7jU+RV++y1julovLi9iqhAW8mN+WQVFYM
         zPDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:from:cc:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U3IcGLKOjvaTyzTUS9C/MMMRO8g7hgaBW9dEJGasaM8=;
        b=cBdIj4IBYgU/K1VbPRj8U35jVkTNwuCszW0+IPgfYjBA0JBnWcFH0Mdguu8iw/Jz4F
         HGg0kzUDpYAAI2BVNWL2ATQ3rEdpH2apa2t7xcJclv3KxCFFiSqiXOIPlZF1EXwhvfCn
         AQ7pQjYIunSilLFXUyO4bPmE/qlilA12vhbPHjh3IgTOgdDjl5b8oGBZ8C4hW+Xrq8+s
         LAfZWneq5N0EWtIg1ur7xYb2V1wGYSkHQbs+wNF5zz7BOCvh/2+xf4YvF36ouzl7PcbE
         G0t9d+/pDnbWp0x+F6RTuWQ6AwgnGfa+zxsPKzHEIOg+KENEszYiRPYQanXSRLwPjzsS
         CXsQ==
X-Gm-Message-State: ACrzQf2OBJUGgu9wnzP/zzqIx0KSpCYtk+INhLW6kevLsAIPTOM3ttqQ
	W7EccBLSr5e8/S08S5zfsEII6m5G3Q/+3HAC
X-Google-Smtp-Source: AMsMyM5E1eMkY733vs4tGfT+q+aO2SJAeN8KpMRDCyyBzxVF0WWEbIQQmJkW/TPgfaHD67o/+A080w==
X-Received: by 2002:a17:90b:2812:b0:205:cdc9:2ccf with SMTP id qb18-20020a17090b281200b00205cdc92ccfmr1484044pjb.97.1665690492699;
        Thu, 13 Oct 2022 12:48:12 -0700 (PDT)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id jf15-20020a170903268f00b00181f8523f60sm213118plb.225.2022.10.13.12.48.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Oct 2022 12:48:12 -0700 (PDT)
In-Reply-To: <20220924070737.3048-1-jszhang@kernel.org>
References: <20220924070737.3048-1-jszhang@kernel.org>
Subject: Re: [PATCH v3] riscv: vdso: fix NULL deference in vdso_join_timens() when vfork
Message-Id: <166569033638.14806.1663998722831611197.b4-ty@rivosinc.com>
Date: Thu, 13 Oct 2022 12:45:36 -0700
MIME-Version: 1.0
X-Mailer: b4 0.11.0-dev-36ce3
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Guo Ren <guoren@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>,
  Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Jisheng Zhang <jszhang@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221013_124815_594451_C0AE5C18 
X-CRM114-Status: UNSURE (   6.39  )
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

On Sat, 24 Sep 2022 15:07:37 +0800, Jisheng Zhang wrote:
> Testing tools/testing/selftests/timens/vfork_exec.c got below
> kernel log:
> 
> [    6.838454] Unable to handle kernel access to user memory without uaccess routines at virtual address 0000000000000020
> [    6.842255] Oops [#1]
> [    6.842871] Modules linked in:
> [    6.844249] CPU: 1 PID: 64 Comm: vfork_exec Not tainted 6.0.0-rc3-rt15+ #8
> [    6.845861] Hardware name: riscv-virtio,qemu (DT)
> [    6.848009] epc : vdso_join_timens+0xd2/0x110
> [    6.850097]  ra : vdso_join_timens+0xd2/0x110
> [    6.851164] epc : ffffffff8000635c ra : ffffffff8000635c sp : ff6000000181fbf0
> [    6.852562]  gp : ffffffff80cff648 tp : ff60000000fdb700 t0 : 3030303030303030
> [    6.853852]  t1 : 0000000000000030 t2 : 3030303030303030 s0 : ff6000000181fc40
> [    6.854984]  s1 : ff60000001e6c000 a0 : 0000000000000010 a1 : ffffffff8005654c
> [    6.856221]  a2 : 00000000ffffefff a3 : 0000000000000000 a4 : 0000000000000000
> [    6.858114]  a5 : 0000000000000000 a6 : 0000000000000008 a7 : 0000000000000038
> [    6.859484]  s2 : ff60000001e6c068 s3 : ff6000000108abb0 s4 : 0000000000000000
> [    6.860751]  s5 : 0000000000001000 s6 : ffffffff8089dc40 s7 : ffffffff8089dc38
> [    6.862029]  s8 : ffffffff8089dc30 s9 : ff60000000fdbe38 s10: 000000000000005e
> [    6.863304]  s11: ffffffff80cc3510 t3 : ffffffff80d1112f t4 : ffffffff80d1112f
> [    6.864565]  t5 : ffffffff80d11130 t6 : ff6000000181fa00
> [    6.865561] status: 0000000000000120 badaddr: 0000000000000020 cause: 000000000000000d
> [    6.868046] [<ffffffff8008dc94>] timens_commit+0x38/0x11a
> [    6.869089] [<ffffffff8008dde8>] timens_on_fork+0x72/0xb4
> [    6.870055] [<ffffffff80190096>] begin_new_exec+0x3c6/0x9f0
> [    6.871231] [<ffffffff801d826c>] load_elf_binary+0x628/0x1214
> [    6.872304] [<ffffffff8018ee7a>] bprm_execve+0x1f2/0x4e4
> [    6.873243] [<ffffffff8018f90c>] do_execveat_common+0x16e/0x1ee
> [    6.874258] [<ffffffff8018f9c8>] sys_execve+0x3c/0x48
> [    6.875162] [<ffffffff80003556>] ret_from_syscall+0x0/0x2
> [    6.877484] ---[ end trace 0000000000000000 ]---
> 
> [...]

Applied, thanks!

[1/1] riscv: vdso: fix NULL deference in vdso_join_timens() when vfork
      https://git.kernel.org/palmer/c/a8616d2dc193

Best regards,
-- 
Palmer Dabbelt <palmer@rivosinc.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
