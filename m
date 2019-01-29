Return-Path: <SRS0=xvkM=QF=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3A8DC282C7
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 29 Jan 2019 03:53:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 72DA02175B
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 29 Jan 2019 03:53:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="aMGk4q1N";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vi/jwflB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 72DA02175B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QyjDmfEPIW26evtowV1vUiUQa3vqGvnRDDRR1Qz6a8o=; b=aMGk4q1NUJ+WiN
	L2Mm6irCSjg51LE94vJL4sNpBHMG1nUndrU0LUg/D8tsM1lklHvm0g2/FyIq+ocFZTc30kr2Vxh+P
	ThU8w6ipmWZg/KK1DgRCH7SRhmBk/kDVkWRyfORcOTksn41PgVP7Hs07viBdKJX/A1a97tdF9luPd
	BjcwLyK74NbWT5wwsA0O5TWEgg+uuW//oEUTarQrDD4i1qlXtPdhWuqqdtYuiVzv+fowIZDHh/yOh
	nI+rZblNtyaFH3sT/bG7/24L1zRYttbIPU0lOM6vMpkk3r3CNxzJAmCUlNaeZnVh/k4k9OPLVaclJ
	FU0WqLTiVzK1bgHlx2Jw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1goKSg-0005dS-Nn; Tue, 29 Jan 2019 03:53:22 +0000
Received: from mail-vs1-xe2b.google.com ([2607:f8b0:4864:20::e2b])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1goKSc-0005cr-Va
 for linux-riscv@lists.infradead.org; Tue, 29 Jan 2019 03:53:21 +0000
Received: by mail-vs1-xe2b.google.com with SMTP id x64so11158116vsa.5
 for <linux-riscv@lists.infradead.org>; Mon, 28 Jan 2019 19:53:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Rv6C7HmIpYA4RmtRzHWQ7pu2tyJRoMnmtPJgJ/hjc94=;
 b=Vi/jwflBEIuF8inVAQWofP45w+N7PsZXqXxWW/qYVkKRWmFy80MwJZqio9kir3GHfh
 P1Ow21irt81/JaFYJLFemWMETpER1orSqhZ1lAak9p6iAhXTKe2R9zzEpr2yqZmoYswJ
 GJJyRVBa6YQxx1DbpB5PWb1gZW1lFUtga/AwZKRQbEKK1mZWTDAZsc4MxViAP8QUT59h
 A6XSF6tqdAs0RYAWo9AsEAGiehV7I7grmmT6Xo8zftLyx37xlw9JpjUqQEtfaPZXJpE6
 w76yOX9eI/CErHqffVJhWZVZ9sGtY5lwRUx3C7/v4PfkcjQ8Tu3AdCqfP4IMLjYH1hM5
 RTMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Rv6C7HmIpYA4RmtRzHWQ7pu2tyJRoMnmtPJgJ/hjc94=;
 b=Knf+nvEfp+ZQEql2RHyqAqFLwinoEVXXuCT+SeorNb5kBdwKQpzjgb8eVpJvybww63
 8ltwf0n7HHf8AryI/rqItc+62PvlwxYrfiP4Ofbs/7VXIDEEqLY/FKmX8VWi2n3CwxP3
 iesFVQ2CTeq9eWgERqK5TPijWtSUoKHFVgwQ54b9vWosQMF8JJZJSQiAbYmq/ApcGYoz
 DGtu3uV/hwhYLPYVivH7K9khjmlmVuDPB9gEUjO8+99TUIpDqy+qR9tgQ5JGzgzhU/YR
 JfYy5vevhAISt4HjEKTp3Gl6iQAJo0Z4rKFSm8advx7ulcy3L1HeTwycof2lM4bAxTet
 jJgA==
X-Gm-Message-State: AJcUukd+2sBxSO04F4nCCVVdsuXg42HbABAHOqnlPYh/6oTmcugtL9tc
 65VHpN62NSShjGxE19MfJg5IoB8MbzG4NdDt3pw=
X-Google-Smtp-Source: ALg8bN6bB7SBAmuyzsUzwKIrimbOJimpmpV/s21Hd/pDdcMk0jSHmBQhyDXHLYkhZfhRIqWais7c7f9L6QFE8aeyu9E=
X-Received: by 2002:a67:efd1:: with SMTP id s17mr10571575vsp.119.1548733995407; 
 Mon, 28 Jan 2019 19:53:15 -0800 (PST)
MIME-Version: 1.0
References: <4aef7216-726c-f565-5c0f-cebd2aefb46d@wdc.com>
 <CAPweEDySAg6LCTNOKHB2Ax3tJNySi9XQzG4d1msSQQepwDi8Vw@mail.gmail.com>
 <2e5329eff04e2b0bc2433b5d974bf10f@mailhost.ics.forth.gr>
 <CAPweEDz-7oRg2UWPkvTDdfi36Z4PQLAuLdL3-Sy-kmkGEJ=44A@mail.gmail.com>
 <CAP6exYKfhtgXz4nVSwXasicbE+8ZbKwp-15_xGFHfFoK9yi9-g@mail.gmail.com>
 <7efecac7-17bd-5fc1-d0de-9fd498db4751@wdc.com>
 <d476c0e2b525fb0642b3155a247495cb1850c208.camel@kernel.crashing.org>
 <452be0d3-da8e-643e-9f91-c38f0af36ffd@suse.de>
 <CAPweEDwdByUTHnbKGS-LbwGzqsjjWciWOBnPOKkNqupY--vV2A@mail.gmail.com>
 <033872b8-49d5-2731-118f-967488f4763f@suse.de>
 <CAP6exYJRhw=nnhdrNQc7wOBUTYk0-LNaRQrhin7fqxeXMrEhkQ@mail.gmail.com>
 <09bede45-6ecf-4ded-8615-0be38aac33fc@groups.riscv.org>
In-Reply-To: <09bede45-6ecf-4ded-8615-0be38aac33fc@groups.riscv.org>
From: Samuel Falvo II <sam.falvo@gmail.com>
Date: Mon, 28 Jan 2019 19:58:00 -0800
Message-ID: <CAEz=sok-+NFcZtUcSnWKGC5PKqhzkAjLvbKbVjsUhzS5BTrgsQ@mail.gmail.com>
Subject: Re: [sw-dev] SBI extension proposal v2
To: Paul Miranda <paulcmiranda@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190128_195319_046609_72A248D3 
X-CRM114-Status: UNSURE (   7.57  )
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
 Olof Johansson <olof.johansson@gmail.com>, alankao@andestech.com, "Chang,
 Abner" <abner.chang@hpe.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Palmer Dabbelt <palmer@sifive.com>, Alexander Graf <agraf@suse.de>,
 zong@andestech.com, atish.patra@wdc.com,
 RISC-V SW Dev <sw-dev@groups.riscv.org>, paul.walmsley@sifive.com,
 Anup Patel <anup@brainfault.org>, mick@ics.forth.gr, Alistair.Francis@wdc.com,
 Luke Kenneth Casson Leighton <lkcl@lkcl.net>, linux-riscv@lists.infradead.org,
 Andrew Waterman <andrew@sifive.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, Jan 28, 2019 at 7:48 PM Paul Miranda <paulcmiranda@gmail.com> wrote:
> I don't know enough about the rest of this thread to comment intelligently, but I'm curious what you advocate with respect to PMP?
> I believe it has usefulness in allowing M mode code to protect it from itself. Is your only concern that it may be used by ROM code that is not replaceable?
> It's definitely not the first protection scheme I've seen that uses lock bits.

If I understand Ron's emails correctly, he already indicated his
experience with such systems, and is basing his dislike of PMP
expressly on that experience.  It seems history records this feature
being abused rather profusely.

-- 
Samuel A. Falvo II

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
