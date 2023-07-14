Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 917F0C001DC
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Jul 2023 14:06:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3FwFwxmf7/ytecUa5CtPwKcUjIjvQs+s8BipjcuJh7M=; b=qLTyY0LBUe9n5+
	5EWBoM49gp1xEb/mCcBB/40upr4bDu/hPlEVuQABmm0nqIkvYr9CZVn6YJDA9TRxl/sUQuXwPxZSK
	5mfZEBa3C/3jTDNxD/dF/t0geiFfLRcokNLD2IPrRd/XIi42zSJzmWDk8DdKCunTTWLmiVcSvfoPy
	X8/ozLxx5yDTwuoYy3lrK7Lne2ZDejEfnewd3H/xixllAxHQXFsDcXww6QEaN0y0Y0UcQ9CgHQG7X
	sLD0174IZwknphlSqmz3LnnPMQAiwxsDMJ/xGHhuBgzRQq42OfM0uqQOgZLoMEpRCxCn/xArWTUS+
	F00RI5mJp0FdSmoCgybA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qKJQl-006LoT-1X;
	Fri, 14 Jul 2023 14:05:59 +0000
Received: from smtp-out2.suse.de ([2001:67c:2178:6::1d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qKJQi-006Lle-2N;
	Fri, 14 Jul 2023 14:05:58 +0000
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id D2D961F747;
	Fri, 14 Jul 2023 14:05:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1689343551;
	h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
	 cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=WfJYvmV12IuAluB3xxpilLWbnnbGqme6TLcXjOvVTys=;
	b=qOb3n5CgUl/kxztnUq+EG3DQjjAw7kU0gPdV+91ITOdnPR5Ruh2eoXbnOwJ1jIVbrkvdTa
	deCwzyBOT7WtSLgxmEYtUL2D6Abfza5mkN4mZ6MTQTxFr/7E/I83KlVs+Z2kIa58M5H9F7
	P152JWT0JFnKDyAikCQCl1wns3Y6bxU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1689343551;
	h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
	 cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=WfJYvmV12IuAluB3xxpilLWbnnbGqme6TLcXjOvVTys=;
	b=8SacSFrMGznoswC3DLlSI9eAQn481Dq8gZ3qFdvYfFr/5pVQhmCFltTS3Vrh5kJCPOvliz
	+xMjlRGwh91cZzCQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 62C1E138F8;
	Fri, 14 Jul 2023 14:05:51 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id XKdBFz9WsWRNEwAAMHmgww
	(envelope-from <dsterba@suse.cz>); Fri, 14 Jul 2023 14:05:51 +0000
Date: Fri, 14 Jul 2023 15:59:14 +0200
From: David Sterba <dsterba@suse.cz>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Conor Dooley <conor@kernel.org>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Nishanth Menon <nm@ti.com>, linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>, Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>, soc@kernel.org,
	workflows@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH 2/3] Documentation/process: maintainer-soc: add clean
 platforms profile
Message-ID: <20230714135914.GI20457@twin.jikos.cz>
References: <20230714084725.27847-1-krzysztof.kozlowski@linaro.org>
 <20230714084725.27847-2-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230714084725.27847-2-krzysztof.kozlowski@linaro.org>
User-Agent: Mutt/1.5.23.1-rc1 (2014-03-12)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230714_070556_981556_1FDE3826 
X-CRM114-Status: UNSURE (   9.19  )
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
Reply-To: dsterba@suse.cz
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, Jul 14, 2023 at 10:47:24AM +0200, Krzysztof Kozlowski wrote:
> +Overview
> +--------
> +
> +SoC platforms or subarchitectures follow all the rules from
> +Documentation/process/maintainer-soc.rst.  However platforms referencing this

Just a drive by comment, references to highly relevant documents should
be clickable, so :doc:`Documentation/process/maintainer-soc` , with
exceptions like if the document has been referenced already.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
