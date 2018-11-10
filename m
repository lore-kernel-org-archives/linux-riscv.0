Return-Path: <SRS0=valo=NV=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A642BC43441
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 10 Nov 2018 17:47:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 79D6C20854
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 10 Nov 2018 17:47:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="T75WpiAx";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="mZ68tj6P";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=lkcl.net header.i=@lkcl.net header.b="o8aI2XeU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 79D6C20854
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lkcl.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XkcdRAir6G6fWdREH4ULyHQt7Ke+FNiS1vgUT53QbTk=; b=T75WpiAx9WVEsx
	R2Iv3eJN17TaIXpM4b87UKXCx/SlHOC8cRho2epqrDy6LWH8Seop9ZfK9/6TN9c2EhlrK+LBn2Ojo
	4FKXERFU2FRfWrcANfTMf9PWFTelqppozhJUPiHSfCmdbOj+dQtOU0cf5x1R7+rEtaUR3MnM+T7Hc
	UWtcqN5hLZy3a5WDTx1L3JxJtUYgVM1zPMZjpMCscFcO/Fj7FXKIAetsUah5jng/VKAKzN5OrXDj7
	jBbCcJ0oMFMBp5y5BTj5npD1z/w9t+maSq0h6zhZwMI72zm4THL/Gva6UBEV0gaQajRkaHwdiL2Lr
	Q0KgUPQUSGMKIGiZ/MzA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gLXMU-0007FD-Mg; Sat, 10 Nov 2018 17:47:58 +0000
Received: from merlin.infradead.org ([2001:8b0:10b:1231::1])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gLXMS-0007F0-Ml
 for linux-riscv@bombadil.infradead.org; Sat, 10 Nov 2018 17:47:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Content-Type:Cc:To:Subject:Message-ID:
 Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=nFEzcUFAw1zH7qRFKQrjpaw/yckXg+xdWf6VXQktw8g=; b=mZ68tj6Pf7fqxZjRBxpZ4kMub
 LFlMgVrLeKxtcbo3q7f6CY5HsNw3/lavvAcHhNDzhX9cS/Mb1IomGmJCCk6lXlUSxs1UuLXpHrWev
 XcjdPjXNH66jZRjZW1I5RK8xVYtTXB625fpNC7717pCoHjvYkfWpzbClLGM9bPqk7U/3DQj8rUP/5
 ek2niB8hG+qSkTEDNb2UfBOu4QQ6Ua4uO/bxqMITY+wIGEnFui9cxXqI3QxMcXMEj4XnP4SLQxVZM
 8oVKqYLcYEOXoauYq+eZCixfYxYW757DgoAtTk6Up7qsixXIFqX2hErA2xQQbn3OrG+Q1zPUlDEd8
 bTmuzrt3w==;
Received: from lkcl.net ([217.147.94.29])
 by merlin.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gLXMQ-0006QO-9R
 for linux-riscv@lists.infradead.org; Sat, 10 Nov 2018 17:47:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lkcl.net;
 s=201607131; 
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version;
 bh=nFEzcUFAw1zH7qRFKQrjpaw/yckXg+xdWf6VXQktw8g=; 
 b=o8aI2XeUhydFR6z2DZLxV/28uz1hjIcaaDaYBjwtDL4s3h0Efkf3ZjFFvDVm6dvl+YdFEICMez91aTqcJI/9HhTkmeJAjwVKtbqAizytWw0aFh83nLa0RyLnXuGlkvlthDSI7OV5ZEh4wuj4CfEdrdxZuiQc+NOp63YpavmuRT4=;
Received: from mail-lf1-f45.google.com ([209.85.167.45])
 by lkcl.net with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.84_2) (envelope-from <lkcl@lkcl.net>) id 1gLXME-0008Dq-JE
 for linux-riscv@lists.infradead.org; Sat, 10 Nov 2018 17:47:42 +0000
Received: by mail-lf1-f45.google.com with SMTP id i26so3521666lfc.0
 for <linux-riscv@lists.infradead.org>; Sat, 10 Nov 2018 09:47:21 -0800 (PST)
X-Gm-Message-State: AGRZ1gKObSJ57fZc3xiZZMhdkega72lrq7hu9y6e3R9oXI8oefDsG8lh
 EFEDzGntGVcOHMxmhtb05WLlCnABqLTM3dXqknw=
X-Google-Smtp-Source: AJdET5di9ncmc9QUMnQ+197EKcIsI0hFXVDNnCoXD5BobXLnMVL0dRjyB/kjMvveGZTJELZ8bpAHbj6KhxUT5Q1yU8k=
X-Received: by 2002:a19:5059:: with SMTP id z25mr7787578lfj.120.1541872036184; 
 Sat, 10 Nov 2018 09:47:16 -0800 (PST)
MIME-Version: 1.0
References: <4aef7216-726c-f565-5c0f-cebd2aefb46d@wdc.com>
 <CAPweEDySAg6LCTNOKHB2Ax3tJNySi9XQzG4d1msSQQepwDi8Vw@mail.gmail.com>
 <2e5329eff04e2b0bc2433b5d974bf10f@mailhost.ics.forth.gr>
 <CAPweEDz-7oRg2UWPkvTDdfi36Z4PQLAuLdL3-Sy-kmkGEJ=44A@mail.gmail.com>
 <CAP6exYKfhtgXz4nVSwXasicbE+8ZbKwp-15_xGFHfFoK9yi9-g@mail.gmail.com>
 <CAOesGMjVFGLfqVqmsK6V88cdTxmN_CAEhDey8nxKOeTYHC69jA@mail.gmail.com>
In-Reply-To: <CAOesGMjVFGLfqVqmsK6V88cdTxmN_CAEhDey8nxKOeTYHC69jA@mail.gmail.com>
From: Luke Kenneth Casson Leighton <lkcl@lkcl.net>
Date: Sat, 10 Nov 2018 17:47:04 +0000
X-Gmail-Original-Message-ID: <CAPweEDwDApbFofs689xvPBjoqODCeMyaYQWpgo3CuqSjQjYTvw@mail.gmail.com>
Message-ID:
 <CAPweEDwDApbFofs689xvPBjoqODCeMyaYQWpgo3CuqSjQjYTvw@mail.gmail.com>
Subject: Re: [sw-dev] SBI extension proposal v2
To: Olof Johansson <olof@lixom.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181110_124754_441797_600999C9 
X-CRM114-Status: UNSURE (   8.30  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: mark.rutland@arm.com, hch@infradead.org, Damien.LeMoal@wdc.com,
 Olof Johansson <olof.johansson@gmail.com>, alankao@andestech.com,
 abner.chang@hpe.com, atish.patra@wdc.com, Anup Patel <anup@brainfault.org>,
 Palmer Dabbelt <palmer@sifive.com>, Alexander Graf <agraf@suse.de>,
 zong@andestech.com, ron minnich <rminnich@gmail.com>, sw-dev@groups.riscv.org,
 paul.walmsley@sifive.com, mick@ics.forth.gr, Alistair.Francis@wdc.com,
 linux-riscv@lists.infradead.org, Andrew Waterman <andrew@sifive.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181110174704.pxdOkLRmlqZWIMlWUgYkPG_PknEfU6jbh-aYAbYwtQ4@z>

On Sat, Nov 10, 2018 at 5:42 PM Olof Johansson <olof@lixom.net> wrote:

> The case of console is in this case pretty simple: It's intended for
> early boot for very simplistic environments (before the rest of the
> kernel is up, etc). Keeping the SBI console around beyond early boot,
> and somehow trying to optimize for it for those use cases is a
> misdirected effort; that's what native drivers are for.

 spike (which is only around 7,000 lines of code) doesn't have native
drivers, and qemu is too heavy-duty to consider adding custom
extensions and experimental research onto.

 with nothing in spike *other* than the serial console, it's the only
way in and out.

 l.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
