Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5649C8303F
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Jul 2025 11:33:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9EosLP5rgcUoX+4fv3eKTKjuZkvbXJPOpahKGoSkxi4=; b=Ehgp6WxBiabgVE
	owA3o+fT7R58ZKCcBcjepNLQSQaSMk7w+t0E12gUKFiD9u3XA7As7SBEGoi15PPowN8BJSGDbPEHi
	JvBthwLoPPVIof19IPk2gfAoL4GowbznKZ3GwNhVxqPPVuHVUK4NFIR8Obb/okYZTBhO9SDvyk8LY
	in+7SDj9vTgqfjdPpV2/4cMvrtlDck1gi0hnr0UeyzaXpu4vZFl6BauAA2o3lyOa7v8QsjaCGV8zo
	div1ksghAUHoO9jwX2N0lhoOEyZ/38E/tor9KHm073yl9V4AXpVrm+TH1nHrUZP3Yk95bPQOlX1O5
	DcIbNObIKxLz0XbNoqGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWviS-0000000893k-0qbL;
	Wed, 02 Jul 2025 11:33:28 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWv3B-000000080RJ-1h86
	for linux-riscv@lists.infradead.org;
	Wed, 02 Jul 2025 10:50:51 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id D1B6D25989;
	Wed,  2 Jul 2025 12:50:44 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wXDIgFDv1hRC; Wed,  2 Jul 2025 12:50:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1751453443; bh=vmWjYoBfYxlOYco20r6RIBn8cZBvLKaPN8KKU21TzFQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=RnVx24f9NbGTPcW02J4/MbYtrfymL7Riba0/wdfkV2lAwx9rP1m+kCb0/bcq307O4
	 oo9GMzcj/rrGQHZbDaRM4t07RH4cxgUK3TTX28E+t9UGTl7uB57tiZLJIqt+uWJY9G
	 8V4Hut87c6Yg8tkudmT3/DYNX8AokQCL2xqQN6Ney3mA4DulZg7hJIyOQHsQNWydD0
	 kuTPDcem79XpW8KZVfCXb5OyWqMHGfDMNuXZCECPze1vHh8B1U4vylPGACv1d2nfOA
	 UFivrXR741lHUtMOtf8VrjvIZpDhJpYf9idLf9b7WxCIwe5TC3y24Iyw73FmSH5JD+
	 HB4t47eI68uJQ==
Date: Wed, 2 Jul 2025 10:50:24 +0000
From: Yao Zi <ziyao@disroot.org>
To: Alexandre Ghiti <alex@ghiti.fr>, Andy Chiu <andybnac@gmail.com>,
	alexghiti@rivosinc.com, palmer@dabbelt.com,
	Andy Chiu <andy.chiu@sifive.com>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@rivosinc.com>,
	Mark Rutland <mark.rutland@arm.com>, puranjay12@gmail.com,
	paul.walmsley@sifive.com, greentime.hu@sifive.com,
	nick.hu@sifive.com, nylon.chen@sifive.com, eric.lin@sifive.com,
	vicent.chen@sifive.com, zong.li@sifive.com,
	yongxuan.wang@sifive.com, samuel.holland@sifive.com,
	olivia.chu@sifive.com, c2232430@gmail.com
Cc: Han Gao <rabenda.cn@gmail.com>, Vivian Wang <wangruikang@iscas.ac.cn>,
	linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
	regressions@lists.linux.dev, linux-riscv@lists.infradead.org
Subject: Re: [REGRESSION] Random oops on SG2042 with Linux 6.16-rc and
 dynamic ftrace
Message-ID: <aGUO8L7oXpvEpvZo@pie.lan>
References: <aGODMpq7TGINddzM@pie.lan>
 <b060e694-caa0-4aa5-ac67-75531a5f60eb@ghiti.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b060e694-caa0-4aa5-ac67-75531a5f60eb@ghiti.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250702_035049_852022_2B6E3CDE 
X-CRM114-Status: GOOD (  24.18  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Jul 01, 2025 at 02:27:32PM +0200, Alexandre Ghiti wrote:
> Hi Yao,
> =

> On 7/1/25 08:41, Yao Zi wrote:
> > Linux v6.16 built with dynamic ftrace randomly oops or triggers
> > ftrace_bug() on Sophgo SG2042 when booting systemd-based userspace,

...

> > Not sure either reverting the commits or fixing them up is a better
> > idea, but anyway the fatal first issue shouidn't go into the stable
> > release.
> =

> Let's fix this, we were expecting issues with dynamic ftrace :)
> =

> So the following diff fixes all the issues you mentioned (not the first
> crash though, I'll let you test and see if it works better, I don't have
> this board):

Thanks for the fix! I've tested it with both QEMU and SG2042, it does
fix the lockdep failures as well as the boot time crash on SG2042. The
boot-time crash is caused by the race so will disappear as long as we
fix the race.

> diff --git a/arch/riscv/kernel/ftrace.c b/arch/riscv/kernel/ftrace.c
> index 4c6c24380cfd9..97ced537aa1e0 100644
> --- a/arch/riscv/kernel/ftrace.c
> +++ b/arch/riscv/kernel/ftrace.c
> @@ -14,6 +14,16 @@
> =A0#include <asm/text-patching.h>
> =

> =A0#ifdef CONFIG_DYNAMIC_FTRACE
> +void ftrace_arch_code_modify_prepare(void)
> +{
> +=A0=A0=A0=A0=A0=A0 mutex_lock(&text_mutex);
> +}
> +
> +void ftrace_arch_code_modify_post_process(void)
> +{
> +=A0=A0=A0=A0=A0=A0 mutex_unlock(&text_mutex);
> +}
> +
> =A0unsigned long ftrace_call_adjust(unsigned long addr)
> =A0{
> =A0=A0=A0=A0=A0=A0=A0 if (IS_ENABLED(CONFIG_DYNAMIC_FTRACE_WITH_CALL_OPS))
> @@ -29,10 +39,8 @@ unsigned long arch_ftrace_get_symaddr(unsigned long
> fentry_ip)
> =

> =A0void arch_ftrace_update_code(int command)
> =A0{
> -=A0=A0=A0=A0=A0=A0 mutex_lock(&text_mutex);
> =A0=A0=A0=A0=A0=A0=A0 command |=3D FTRACE_MAY_SLEEP;
> =A0=A0=A0=A0=A0=A0=A0 ftrace_modify_all_code(command);
> -=A0=A0=A0=A0=A0=A0 mutex_unlock(&text_mutex);
> =A0=A0=A0=A0=A0=A0=A0 flush_icache_all();
> =A0}
> =

> @@ -149,16 +157,17 @@ int ftrace_init_nop(struct module *mod, struct
> dyn_ftrace *rec)
> =A0=A0=A0=A0=A0=A0=A0 unsigned int nops[2], offset;
> =A0=A0=A0=A0=A0=A0=A0 int ret;
> =

> +=A0=A0=A0=A0=A0=A0 mutex_lock(&text_mutex);

Besides using the guard API, could we swap the order between
ftrace_rec_set_nop_ops() and calculation of the nops array? This shrinks
the critical region a little.

With or without the change, here's my tag,

Tested-by: Yao Zi <ziyao@disroot.org>

and also

Reported-by: Han Gao <rabenda.cn@gmail.com>
Reported-by: Vivian Wang <wangruikang@iscas.ac.cn>

for their first-hand report of boot-time crash and analysis for the
first lock issue.

Regards,
Yao Zi

> =A0=A0=A0=A0=A0=A0=A0 ret =3D ftrace_rec_set_nop_ops(rec);
> =A0=A0=A0=A0=A0=A0=A0 if (ret)
> -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return ret;
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 goto end;
> =

> =A0=A0=A0=A0=A0=A0=A0 offset =3D (unsigned long) &ftrace_caller - pc;
> =A0=A0=A0=A0=A0=A0=A0 nops[0] =3D to_auipc_t0(offset);
> =A0=A0=A0=A0=A0=A0=A0 nops[1] =3D RISCV_INSN_NOP4;
> =

> -=A0=A0=A0=A0=A0=A0 mutex_lock(&text_mutex);
> =A0=A0=A0=A0=A0=A0=A0 ret =3D patch_insn_write((void *)pc, nops, 2 * MCOU=
NT_INSN_SIZE);
> +end:
> =A0=A0=A0=A0=A0=A0=A0 mutex_unlock(&text_mutex);
> =

> =A0=A0=A0=A0=A0=A0=A0 return ret;
> =

> Andy is also taking a look, I'll let him confirm the above fix is correct.
> =

> Thanks for the thorough report!
> =

> Alex
> =

> =

> > =

> > Thanks for your suggestions on the problems.
> > =

> > Regards,
> > Yao Zi
> > =

> > [1]: https://lore.kernel.org/all/20250407180838.42877-1-andybnac@gmail.=
com/
> > =

> > #regzbot introduced: 881dadf0792c
> > =

> > _______________________________________________
> > linux-riscv mailing list
> > linux-riscv@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
