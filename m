Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4ADECCA470
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Oct 2025 08:09:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cXDIqyH8WYJ24bZhqPwnoRcjAypUIUJxEFVcGjAtjO8=; b=jsoh0bcZpH2eFF
	W2g6NgD/LMG8DYezogIgkqiMR381WGw5vshskS9NHrVs2AuOCl7wINM8Nc+Q0vWGX2NVHOTZ+wn7f
	WpJh4+eD5TCM4f5MATltNyKv+Uw/3votu7BCiKO0pcO9HfBIBCNeQECDweKLTKBSVNCzPUej6RbWI
	lvZRy/A7XmxA1XRcXRJaDs5tjre1BBVbyU6AGR4viUwVBsqxjm5FXc6D2IYht3eFQSG4OsX8tqanO
	8gkiIN3VeiiRXiI3Ejq8QuVYne5odaQzDMBg8hUOR8egd2KUfNJnRxDgBKl4Q+rAyn4wqbw7Y8guf
	OQS1wskFt9wF33itv+cQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6lhm-00000005SPg-12w9;
	Thu, 09 Oct 2025 08:08:54 +0000
Received: from smtpbgbr2.qq.com ([54.207.22.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6lhj-00000005SJi-0iz8
	for linux-riscv@lists.infradead.org;
	Thu, 09 Oct 2025 08:08:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1759997231;
	bh=QomI1gNvaUojwqQoknXFY7m4GYm6zxoKTgnI/BnC6LY=;
	h=Date:From:To:Subject:Message-ID:MIME-Version;
	b=WiaOkJNjAfaOxrrDPIS7pnBdL6f1nW9gDe0qY/RG0qlJd/MbAJ27jdS+34kgOUmRl
	 gLVV9BZ4jBbW5badASFhVDHnU+USXqRKFu6uWqYBeENV2WNIY+urgKjT5maAFk8SS4
	 iRy9cmlmZ+J6TV6nHE6bjlgrhoE/uTu+lpJ8a6U4=
X-QQ-mid: zesmtpsz8t1759997228t014935b9
X-QQ-Originating-IP: 3K5W0OLDLhEJGiGik9gi2j2qEwUpKM2FSNoCg+xeMgg=
Received: from = ( [61.145.255.150])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 09 Oct 2025 16:07:06 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 2621622551196741310
EX-QQ-RecipientCnt: 16
Date: Thu, 9 Oct 2025 16:07:06 +0800
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
To: Conor Dooley <conor@kernel.org>, Yixun Lan <dlan@gentoo.org>
Cc: Troy Mitchell <troy.mitchell@linux.dev>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Yangyu Chen <cyy@cyyself.name>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: riscv: spacemit: Add MusePi Pro board
Message-ID: <A5845378AE731404+aOdtKmFPaYfc2n7n@kernel.org>
References: <20250928-k1-musepi-pro-dts-v1-0-64d0659dfdbc@linux.spacemit.com>
 <20250928-k1-musepi-pro-dts-v1-1-5efcca0ce3ae@linux.spacemit.com>
 <20250928074914-GYA1344940@gentoo.org>
 <20250929-challenge-molecular-947bb1f5962b@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250929-challenge-molecular-947bb1f5962b@spud>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:linux.spacemit.com:qybglogicsvrsz:qybglogicsvrsz3a-0
X-QQ-XMAILINFO: NFzQ23lyTybaeZ7ExXF+lb4WvqLkUZTGx5dizMeHvXofO/gaw5P9piwn
	PlzHCHoslQbx/9SWyFFbPxA7/gDX+n5JEtB1jlSeArx38vetHCOkrXuJPpRwoJQS/nSu1pD
	ELwcI6hpRdM7oKPTc/IA8FdpWYVN0UwJZKqpkmGmAggkwJ6s+XlWOEkkaGzHa6aOCSVT4OU
	q5WFO7STZRC8aM53o1EI86XOMpFvBqjAzqqDU1nyrcTguqhDUZ5fXYzAaeXZS8QsuoPJhmY
	fcJ/KjGyKkIQWg6Is3rrc2sZmapGS4Pd8vnvz3nyq+94v7ZcT3X57dQvok/7SC7e5ldurpY
	/FKWovh5ThgD5FjVOziyjr7rGenQxoetcXw5+M0UKtYqaAUQrZFJEvWs0C7k5akSlJl8I+w
	kgeyuoF9P1cUE8TgCt6xVD5ehKLAQPLwSG18Vbrl0y32ft8lgyF6zFysc/beFcVOA2nYXNd
	65XPSHU6QyfzdzPJog1DavTMRhDl6IXECnKrma0WpiadowJ3xHQ8ZrnaLA208jApOet40kt
	/351iLEDgLkrOOFG95qNdmexhoBm0C7lUGWA5NhF09oS7/fjsJyZixvVpYtSuEHqqGKdYO5
	uQ+GelKzqWMsbVYYv7HCKjcrBJ2eqXvU8sHrFIeyGE94UBUXES0Huotgb5AfhreYSnHeoif
	/yUr0E41EeYwW8wacENk3ltjCz2NO79fBm+MLY2fnGObWyEBnH5WRFT/ptJKWuZZ9SSA7m/
	uOBNsRb7N1am7R1YSx3bvcetkXPuuhGjIe1PUv69CyDTzQob3yOiM8ZnZA+jfVbLHA5h4B8
	OXpDBPWaSjj6l+pi0AhUNLcFzP1rULSoUfC19dCUNPPK1mmVoqVzJZwulHpG4zrwKj1hNhy
	3y2f9C+jZMgVDzH98cThSMyoEkWUshWLWh3UXriO4hwfrAgJn+DBKQn8z/lxY6nvA1aJ95F
	h60FZDVUyFdK3Dxy+s4K8Pct/OF1h/7FwGnj6NMl8s/pnMG8UNejVt859VcKShYdRcPvUAs
	LRWdgSk6JMaIvsJNq4RlbjTA8Db7GCR2bR3d1voj3xhf8O95RVNHdE0Dc7IAcIAnChopjEP
	45vDMXhhEhN9VBuk8a7pKU=
X-QQ-XMRINFO: Nq+8W0+stu50PRdwbJxPCL0=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251009_010852_343691_560BB9AA 
X-CRM114-Status: GOOD (  14.25  )
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

On Mon, Sep 29, 2025 at 06:48:22PM +0100, Conor Dooley wrote:
> On Sun, Sep 28, 2025 at 03:49:14PM +0800, Yixun Lan wrote:
> > Hi Troy,
> > 
> > On 12:16 Sun 28 Sep     , Troy Mitchell wrote:
> > > From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> > > 
> > > Document the compatible string for the MusePi Pro [1].
> > > It is a 1.8-inch single board computer based on the
> > > SpacemiT K1/M1 RISC-V SoC [2].
> > you could wrap at slightly more characters, I remember 72 chars
> > (haven't spent time to find a formal document link..)
> > 
> > > 
> > > Link:
> > > https://developer.spacemit.com/documentation?token=YJtdwnvvViPVcmkoPDpcvwfVnrh&type=pdf
> > I'd suggest to list core features of this board, while using this link as a complement,
> > base on previous experience, vendor may change the link address, thus the link vanish
> 
> The link doesn't even work for me.
Could you double check if it really doesn't work now?

> Is this board actually made by spacemit as a developer platform?
Yes.

                    - Troy

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
