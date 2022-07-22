Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C07AC433EF
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Jul 2022 22:57:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JfpMaBTXU2pzxpl62+PCcgXPzFOO9xbmYwKDCOdzEpk=; b=TpfWD+qYUKW5pb
	e6wLJOPBoHDC+6/TLf4vU+q0JVIu7n6ZqPqsOL2Yl7yGhO2lxsRNrk3KlusuaHQoPzvsFG0jwsjdq
	hoZsEaNGSOQDi/cm5jfapFO1zFIsRcYgRSGvSe2Hr5so/b/qkVsBPl3z6DhyzRfYwwBwr7F8QrG7I
	RB6qIDgMpxALIbpxJbZeC7mNSYq8ODJDKCdUnhPzGx0hwB5tsdPLM5AV4WQxzRXm8sBW0AGmXEE5p
	OhI+DzZQwXL7gzBnDx6O971++qPXrLK1fxWzStMet5iL5GX9nOYAFL71/QfhAiVmwzZIyaigOQX+F
	NGF0gQv+MK9IyAiq6MFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oF1Zn-00CP1M-41; Fri, 22 Jul 2022 22:56:55 +0000
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oF1Zb-00COsd-NJ; Fri, 22 Jul 2022 22:56:44 +0000
Received: by mail-pg1-x536.google.com with SMTP id bf13so5491342pgb.11;
        Fri, 22 Jul 2022 15:56:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=QHz11oQeWHexBI56qDzwQXLxjXmaVbVkx6Bas8PmE/k=;
        b=Ka+ldo0XLtywqq9IwQWZHdMH1dcCO2laspYwU+Op0InQlgp+ogZlovkLGm0DFFuQ/k
         fiHpzEjPIHaMSVKJWqqKAWeBY6r3qcMyNITEJD7s8SEqjAuCuzbd94YZN5lT4XOSECli
         /bnx4vnZI1HO7VFrHsUaEhWya7uD7oaNlBq2TrBrzNACWfrkUPkrdRt7FJlNJ/ntBgKz
         fkwj4EN9wJVaSiexE7LNp+EqHEhjbJ+Q+OT73Dc9gq7EJqakTbEM50Ci0Dr49BBWyxZ8
         287X03pnCwfiKX+9xZ0AUU2My1OT8Jhrr7lx37rBQcjMowlf6q37R8vhEIx7paGvCuaE
         0nmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=QHz11oQeWHexBI56qDzwQXLxjXmaVbVkx6Bas8PmE/k=;
        b=c3IJRMSIA5OriV0ZUSFhA4QJOMT8JVtqnJW2Tk9BXu7jbTH3CslH7cPnX73VB2pD8X
         TE+C9dB1j2mKTzfijJqwa/6SsldKew58d9MasdhrbBSDylOEoQs7H1XJbBkl30xTghu2
         eQfPP+mG3QoXYf1dQGGfCYo2rzIPI4k09l3HWdXTgpDQ6mUxezkxuhCaVXb6caNTX3+p
         rCzkq79C25HegWNqJazimL5O06qUzWkFW6BC3Xd8CEghjYqVkYhOqlgO7Ma2wiIltGQ2
         m5q1xaPPsCjqQElIE29+qGhfWc6pTb2gR7Kej9+HvGfqdDZ4C0cIc5z70wHAzpeAvbB7
         gsog==
X-Gm-Message-State: AJIora+YnULPSXqiIoAW0HwAlTykUgWP48wVocvPpOW0qVrUViVoW/HM
	US+9fDhb2Nc1SlC/PQizWO8=
X-Google-Smtp-Source: AGRyM1ssgspuNhoA5Gk+4Uhjl6x5FR+5SagZFy8Le8E2u02NnQwVlEOFcwcDrNPisPsRABzcoxkccw==
X-Received: by 2002:a05:6a00:855:b0:52b:213d:fc03 with SMTP id q21-20020a056a00085500b0052b213dfc03mr2139243pfk.31.1658530601024;
        Fri, 22 Jul 2022 15:56:41 -0700 (PDT)
Received: from localhost ([2409:10:24a0:4700:e8ad:216a:2a9d:6d0c])
        by smtp.gmail.com with ESMTPSA id v12-20020a17090a6b0c00b001f229f07b27sm4007457pjj.12.2022.07.22.15.56.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Jul 2022 15:56:40 -0700 (PDT)
Date: Sat, 23 Jul 2022 07:56:38 +0900
From: Stafford Horne <shorne@gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, LKML <linux-kernel@vger.kernel.org>,
	Pierre Morel <pmorel@linux.ibm.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Guo Ren <guoren@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Richard Weinberger <richard@nod.at>,
	Anton Ivanov <anton.ivanov@cambridgegreys.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	Bjorn Helgaas <bhelgaas@google.com>,
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
	Linux ARM <linux-arm-kernel@lists.infradead.org>,
	linux-csky@vger.kernel.org,
	linux-riscv <linux-riscv@lists.infradead.org>,
	linux-um <linux-um@lists.infradead.org>,
	linux-pci <linux-pci@vger.kernel.org>,
	linux-arch <linux-arch@vger.kernel.org>
Subject: Re: [PATCH v5 4/4] asm-generic: Add new pci.h and use it
Message-ID: <YtsrJghwLPf3uj4W@antec>
References: <YtsaA2Zjqa/XZZou@antec>
 <20220722223146.GA1947394@bhelgaas>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220722223146.GA1947394@bhelgaas>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220722_155643_795696_97966E75 
X-CRM114-Status: GOOD (  11.63  )
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

On Fri, Jul 22, 2022 at 05:31:46PM -0500, Bjorn Helgaas wrote:
> On Sat, Jul 23, 2022 at 06:43:31AM +0900, Stafford Horne wrote:
> 
> > I will respin a v6 as we didn't get a reply on this.  Bjorn are you
> > planning to apply the series before the upcoming merge window?
> 
> I see your v6, and I can apply it.  I only got patches 1, 2, 4
> (without the csky patch).  Do you want that to go a separate route?  I
> don't care either way, but not sure it improves things to split it
> across trees.

I sent 3/4 directly to you now.  Hopefully you see it.

Patch 4/4 depends on it in a sense so its best to keep 3/4 together.

-Stafford

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
