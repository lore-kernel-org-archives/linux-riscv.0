Return-Path: <SRS0=QO1u=BC=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34741C433E3
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Jul 2020 23:22:21 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 01F3420792
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Jul 2020 23:22:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ke05zQbH";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="bKoMwf4u"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 01F3420792
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:To:From:Date:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=rp0QqjmLNfQ30UHyW3p7Krz/aWNEMmxKLdIyj8v9ehQ=; b=ke05zQbHrKmFHXA4tzo6NWZ1yx
	8nYoIvrqEbpIZj86K0kFJKKUtI6WaCJ4uMka03J374U+rTth8hSeL8qOtvhSFk5BU/RdVtFLSXsaT
	okWfn99t8s/IlTJMfBK95gg8xthsQ8A8fT5ZvR7B93G5fWc2TkPRbsXIlJ/7moa+j+bEn3uTrIMhY
	gag7WHP0HotRmtudqAtzfHr8fJlTtGhRZkV54l7W15sMXqyWwh19ikrXJeAkUgL+w2hGzfHMU+FoG
	cIuPNji7VW2yF1VYTQVoovRGB6jT2KmSnh4NpsBkgKrZV/KdJgyHpfGQd8e44nliJjCDknvDd6gm6
	tSEHnzYA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jykXP-0007tB-Tg; Thu, 23 Jul 2020 23:22:07 +0000
Received: from esa3.hgst.iphmx.com ([216.71.153.141])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jykXN-0007sg-Fu
 for linux-riscv@lists.infradead.org; Thu, 23 Jul 2020 23:22:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1595546525; x=1627082525;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=QgeslEf13WULvCxIOUP4MQ+OmCsX7gpbdkOpEsc+l7k=;
 b=bKoMwf4uu5vzOuX4nJkFHRJtwouQIj64YqtLh25hgN3FR9r9pFJBsK+/
 SZpJY3eUEwF5I9jf11mmFwxwYA3n0/7TJhcH7ELqyyghlJFVhYOibHBd/
 U7PzKzHD8z3RHCnrPNZvfDGXJJzhqCTYJ/lZS/1kPdTzHb2QABUgDYKMe
 En4AmCtB4x5YJSBrCnVYdctth7jBWS+tZcn5DEhMucthQRjn6st6+WAfV
 AG8W9R0kU/Nkwp6fvjyIcFNBfjQxM30ydr+cWV+nTZTcWn/WNNTTAvPth
 lxrM+QBhJeJnfgUKPorias4ZZvgkpv7kcHmFDbojtJQU1eu2eW7wih7Kf g==;
IronPort-SDR: LZYaN45RUoTkIakqE9CYxlP3StB65V3fIaUp3DtEaluRyUGhsTmA5vhnoEqUjg1KbhdK86bDWh
 xRpWf+r10beioz7NIA5C7I+GQOy0qUCXCkPT18OZWu/p0oQGQXojhq0KFAIloe8Ppdwwol2DwQ
 EllbUuBijkEec3uNUzv9LIb1tsoX2sM8ZsaQncQdFmhlvf8zs5T9z2h9xsMrnJC4Dxk26e7Q8o
 po0pWG7NuBMYaQaJXaK4fTLrTz3px+4G8veQzE/OEPYDJnAs17GPMDwlBmC4WvGBegcSwLkJG5
 rEo=
X-IronPort-AV: E=Sophos;i="5.75,388,1589212800"; d="scan'208";a="147549719"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 24 Jul 2020 07:22:02 +0800
IronPort-SDR: AHyHSWWy1Gel2YnZYmqdnvGiMeUfThl88LGgMrF6u8fxlVZmQyhr65UXZhmK+0aGiMS0reRn03
 xOzhkvN0kRH3tvLAkPwulvGeDO1ksUsVo=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2020 16:10:17 -0700
IronPort-SDR: ZPvGnB3aMrvnPWiKC7eRCLgc2ktzcPW7hTaG4A1gddAOuTb3tpozRaADX96nfFxia79ARXWeH9
 j6d7hGRNqG/w==
WDCIronportException: Internal
Received: from unknown (HELO redsun52) ([10.149.66.28])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2020 16:22:01 -0700
Date: Fri, 24 Jul 2020 00:21:57 +0100 (BST)
From: "Maciej W. Rozycki" <macro@wdc.com>
To: linux-riscv@lists.infradead.org
Subject: [PATCH 0/2] riscv: ptrace: NT_PRFPREG regset access fixes
Message-ID: <alpine.LFD.2.21.2007232038170.24175@redsun52.ssa.fujisawa.hgst.com>
User-Agent: Alpine 2.21 (LFD 202 2017-01-01)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200723_192205_666510_0FC9BB6C 
X-CRM114-Status: UNSURE (   7.54  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Albert Ou <aou@eecs.berkeley.edu>, Palmer Dabbelt <palmer@dabbelt.com>,
 linux-kernel@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi,

 In the course of adding RISC-V/Linux support to `gdbserver' I examined 
our Linux regset code to make sure I get the userland side right and 
discovered a discrepancy between how our internal `user_regset_copyout' 
and `user_regset_copyout' API has been defined and how we call it in the 
RISC-V backend in the handling of the NT_PRFPREG regset.  Additionally I 
found that code violating our coding style.

 To address these issues I made this small patch set, addressing each of 
them separately.  See individual change descriptions for details.

 These changes are hopefully obviously correct, however to make sure I 
have verified them manually with a HiFive Unleashed board running 
`gdbserver' controlled remotely by GDB and also by running the full GDB 
testsuite in the same environment using the lp64d ABI, without and with 
the changes applied.

 Please apply.

  Maciej

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
