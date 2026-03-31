Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A84D51061B2C
	for <linux-riscv@archiver.kernel.org>; Tue, 31 Mar 2026 01:58:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QFEKTWaF4v/b57zFaT8NSsomINXwl8aMJW8gEFUQJ7I=; b=llPxRHJ+LW6txt
	tm2golkEbwJzVa8tTZQ4kN/Hb1xE2xerExEbi1SE4TR/mAy5QnTb3B3rDpoc/CQt9gyrw93sQOz67
	r/H+yGCMCBQMdRHj+DnGYVEZaJkj0AGypg8Wa5zv4oUFE+G/Hx5FpqHbsyc7A5MXFMK4VtHJwjinI
	dE/tFTWUBNHVRaMleRyu8eGNtELZyBjIlWw7l7JTdHvNZYqqfCpzZxZkrOD5zhr/vZFqr6uqflH1n
	wZ/gBioik4o/CezVXJ3dShfT9FDBMNWKsEa0j/A/9LsKQMGOb4ayqFi7wpm7NlBaTxeV6d2LhkoCW
	sgqjYaH/5dYNmCag3riA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7ON8-0000000C9mu-0lRU;
	Tue, 31 Mar 2026 01:58:26 +0000
Received: from smtpbg151.qq.com ([18.169.211.239])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7ON4-0000000C9kh-2gxc
	for linux-riscv@lists.infradead.org;
	Tue, 31 Mar 2026 01:58:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1774922246;
	bh=XtgU7u3m8ATvONww0EjKILjjpqHOKR3iuEbKdN8Zh18=;
	h=Date:From:To:Subject:Message-ID:MIME-Version;
	b=kNFYXLoo43sI7yOa4HgQf+ZpzEqgmz0c0YifIp8z4mxDRC8QABKZQtTGzQvR/beD0
	 /62wdLfZpSaVcqJhnY840Vws74eQuMRg68EU+hx8IIc+lCyiltIbMIldXTMCmNVqu8
	 p4G0iyN5sJnZQAYR0vUgpqwLqxF9ENMXBvmKnKBQ=
X-QQ-mid: zesmtpgz6t1774922244tcdd95944
X-QQ-Originating-IP: 6YTJ4mxqFD3mYgJQ7VaqcOKTTPDpfV95ifWMMz/gHXs=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 31 Mar 2026 09:57:22 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 16396334203676912159
EX-QQ-RecipientCnt: 10
Date: Tue, 31 Mar 2026 09:57:22 +0800
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
To: Chukun Pan <amadeus@jmu.edu.cn>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: Yixun Lan <dlan@kernel.org>, Ze Huang <huang.ze@linux.dev>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org, spacemit@lists.linux.dev,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>
Subject: Re: [PATCH v3 1/1] usb: dwc3: Add optional VBUS regulator support to
 SpacemiT K1
Message-ID: <BC093802795A0616+acsqAiB_4ptd2k3t@kernel.org>
References: <20260326100010.3588454-1-amadeus@jmu.edu.cn>
 <20260326100010.3588454-2-amadeus@jmu.edu.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260326100010.3588454-2-amadeus@jmu.edu.cn>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: N71rnkwxYMwyqDkeb55/NvMDEqSgm7/4SH7D0+05HAhIygSSF/ipEuiQ
	ZPRO8cfgoX8QxnALzWS1U1fFKcEhNjprWwfeWVv56OjHCC0QKv9IncbeCkZK6+Dhgg+E9o6
	cx0NsceGNWe7GvUXcSzoOp/rHUH4dg3tbTJ1jnW5pDi9oIq0rFytivjLmSUBfy4Dopm8jV0
	fwue1smcxzuASeSXjMDrICUYsOZxTT5fiK2EbQQhCKehNXRnRDwo+EY4wyKyaSxx+Hd+CLq
	PfgTrD+12hyOWVh/CEWMpgud+LyN2ZNwixsyCSvAjzfhInPSNKrxjqr1LZPKozyoqYGevCs
	EVbPQFoymdSVnHfvwDc3QCAizMzqqAdZWnqcZsT7+Qwb7taHr/HsDiyC8zCawtcI6RUDPNt
	9R7v42TUjzsjOi1donsy6n/+tqoEJ8qI1YRBtBjaQlZi5ktejNkOrb5s7TeCrCa7uIneynv
	h8V+0LLhfyYt6GabARAErSFcNbU9jR8bZsMyk9M8Ya/1/SM7CHqW7zF/Ep0uAPmRdLrybG2
	Iw6AUn1R2xI09vuwzAEglKTCmXHaPgrhHoE2uYJ0SWLdXi8sLbvu8dNxsuqFxrwVkgMdZz8
	7kYcw23dfPO32mprJlWP9w+Cr/iyfyAwcIYwBL0Y1iaajYNx93g6Li/3txxHqPFFK2dJdXH
	ymbYcPAv2tfTbn+XWYIN50hRcQF9SudADoK04BelcRQ+dS4Vm219gy9DXHAn6gmsnDZgIqO
	9ChUMcqFUCEbBNDjvRzOrCzR9X5Q29VvendhleXaOckG/Y+hTqBOUD60l2rNMEXmXi01mfI
	HcqGh9TbqJfNEKghEkMmZCzpPQ+2hF9tdbWhaU34lwRWITfd+J5NIcZsBcWHv1f920f62kG
	MHWfLV98RmTrhz5rWZQ41kzH4wa/wWTM33A6DVhTvWGPja32E4Erj/Kj6D8XjpHht4E3P+k
	zmLo7RpA3TvWpiHDrDEacan2AsY18P1V0wT8T3wYf7OqM1QCxXmdAHMBqx1B29pl3DuNxzn
	Pvd6ZWu8hOMcvPw/8m2uKsnasVMkYxQLvmW7w7Bq1QcGuV2rqVmYvEWPSHNTw=
X-QQ-XMRINFO: OD9hHCdaPRBwH5bRRRw8tsiH4UAatJqXfg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260330_185823_517673_9D1067ED 
X-CRM114-Status: UNSURE (   7.98  )
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

On Thu, Mar 26, 2026 at 18:00:10 CST, Chukun Pan wrote:
> Some SpacemiT K1 boards (like OrangePi R2S) provide USB VBUS
> through a controllable regulator. Add support for the optional
> vbus-supply property so the regulator can be properly managed
> in host mode instead of left always-on. Note that this doesn't
> apply to USB Hub downstream ports with different VBUS supplies.
> 
> The enabled and disabled actions of the regulator are handled
> automatically by devm_regulator_get_enable_optional().
> 
> Signed-off-by: Chukun Pan <amadeus@jmu.edu.cn>
Thanks for the patch.

Reviewed-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
