Return-Path: <SRS0=sWS1=6U=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44288C47254
	for <infradead-linux-riscv@archiver.kernel.org>; Wed,  6 May 2020 00:25:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 04B1120721
	for <infradead-linux-riscv@archiver.kernel.org>; Wed,  6 May 2020 00:25:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tIfr1VmF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 04B1120721
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=outlook.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	From:To:Subject:Content-Description:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Cc:Content-ID:Resent-Date:Resent-From:Resent-Sender:Resent-To:
	Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=3usrcMU2Cf8OJOwTTERzhEGvlYsoJRrxGTuPo4+ncKg=; b=tIfr1VmFP5lRZtelzbQ6JaU3By
	n2obryOv2C6mpE0/geGU1HMHlKikiq6nBRDhFwInD2hCXI+0xZnFnja9MGIu5x5ai7Qse2qFzaY/O
	OVE2cJm++yci2nOgkNGaAVdjJdIv9Ts6Vx6RCzLu311u17QjVoXdC1uYKSpsku2XgG/qnJ5IjLTvJ
	u7pymcdFSJJu/E3vdnFm1PEVekner+bR9bOwwZgjZS1PLCj700uM/nGaiLd4FycbIgh4wefxlQGL2
	tMQt9IKrzEayi0lKDqF/n2ZMJzhwF65VB9EEWfHg1AXaq2Lbq0mhivH4TJg4pG5zYylEwGoDrkKUR
	fvqJvrtA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jW7rw-0004VF-7P; Wed, 06 May 2020 00:25:00 +0000
Received: from zimbra.evolbio.mpg.de ([141.5.8.20])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jW7rm-0004Lq-FV
 for linux-riscv@lists.infradead.org; Wed, 06 May 2020 00:24:52 +0000
Received: from zimbra.evolbio.mpg.de (localhost [127.0.0.1])
 by zimbra.evolbio.mpg.de (Postfix) with ESMTPS id E06A9CEAD08B6
 for <linux-riscv@lists.infradead.org>; Wed,  6 May 2020 02:24:44 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zimbra.evolbio.mpg.de (Postfix) with ESMTP id D342ECEAD079B
 for <linux-riscv@lists.infradead.org>; Wed,  6 May 2020 02:24:44 +0200 (CEST)
Received: from zimbra.evolbio.mpg.de ([127.0.0.1])
 by localhost (zimbra.evolbio.mpg.de [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id rGYeRcTpn_-A for <linux-riscv@lists.infradead.org>;
 Wed,  6 May 2020 02:24:44 +0200 (CEST)
Received: from 192.168.137.1 (unknown [176.41.43.40])
 by zimbra.evolbio.mpg.de (Postfix) with ESMTPSA id A7FBECEAD08B6
 for <linux-riscv@lists.infradead.org>; Wed,  6 May 2020 02:24:44 +0200 (CEST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Description: Mail message body
Subject: We bieden financiering tegen een laag tarief.
To: linux-riscv@lists.infradead.org
From: "Genovese Capital partners " <albert_edgar1@outlook.com>
Date: Wed, 06 May 2020 03:24:42 +0300
Message-Id: <20200506002444.A7FBECEAD08B6@zimbra.evolbio.mpg.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200505_172450_674473_D47E1308 
X-CRM114-Status: UNSURE (  -3.80  )
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
Reply-To: silvano@genovesecapital.net
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Welkom bij Genovese Capital Partners.

We hebben een enorme kredietportefeuille voor het financieren van projecten=
 en bedrijven met een groot volume. De procedures zijn als volgt: -

1-De klant moet een korte samenvatting van het project sturen. Dit moet het=
 totale bedrag bevatten dat nodig is voor het project, geschat rendement op=
 investering, terugbetalingsperiode voor leningen, dit mag niet meer zijn d=
an 15 jaar.

2- De klant moet het genoemde project verzekeren bij een verzekeringsmaatsc=
happij van het totale leenbedrag om de lening als onderpand te garanderen (=
afhankelijk van het leningsbedrag).

3- Het rentepercentage zal jaarlijks 2% bedragen.

4-Terugbetalingsduur is maximaal 15 jaar

5 Financiering duurt ongeveer 10 bankwerkdagen vanaf de dag dat u het verze=
keringscertificaat overlegt of de Neceessary Paper Works heeft voltooid.

=C2=A0
Als u tevreden bent met de bovenstaande procedures, stuur mij dan een inten=
tieverklaring die op het briefhoofd van uw bedrijf staat.

Voor meer informatie over het verkrijgen van een lening van: Reageer alstub=
lieft onmiddellijk op deze e-mail:


Met vriendelijke groet, in afwachting van uw reactie.

Vriendelijke groeten
Caio Pinto

Genovese Capital Partners.
Tel. 07537 121915
WhatsApp: +44 7537166769
Kings Ride, Ascot, SL5 7JR



Welcome to Genovese Capital Partners.

We have a huge Portfolio of Credit, for financing projects and Business of =
large volume. The procedures are as follows:- =


1-The client needs to send a brief summary of the project. This must includ=
e the total amount required for the project, estimated return on investment=
, loan repayment period this must not be more than 15years. =


2- The client will need to insure the said project with an insurance compan=
y of the total loan sum to guarantee the loan as collateral.(Dependent on L=
oan Amount).

3- The interest rate will be 2% annually. =


4-Repayment duration will be a Maximum of  15 Years =


5 Funding will take approximately 10 banking days from the day you present =
the insurance certificate or have completed the Neceessary Paper works. =


 =

If you are satisfied with the above procedures send me a letter of intent w=
riting on your company letterhead. =


For further details to go about procuring a loan from: Kindly respond immed=
iately to this email: =



Regards, as we await your response. =


Best Regards =

Caio Pinto

Genovese Capital Partners.
Tel. 07537 121 915
WhatsApp : +44 7537 166 769
Kings Ride, Ascot, SL5 7JR

