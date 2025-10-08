Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F67ACCA470
	for <linux-riscv@archiver.kernel.org>; Wed,  8 Oct 2025 18:03:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BwI+PkZSM0KaRiEAgukasiY9/7j6sPYbs0AxcaxDukI=; b=zuIaDTnYBzh3T9
	+JQBP4HnGZH7w2w68FdSTC77rYhoTJc6MvCsgcdVdOHoT74EVH2dNWr8t8q+xfv3XCGzJ8XFo+TZg
	Sfi1s7urmP5CslMOqKhz5Mi3Sf8SMa8Bm7jrJ/eJNS4KIaJiqIF4LhR+8HkxcMUXOnpfU9EyH9VTT
	Gp8B49X0YedzRb7gfW2Paazbn78M0a/n8nfg0Ndr62fe9e+iz57fzI6zGPemQV2NB3jZYvUjAzYZs
	2FWsQvnWpwjW5Y5rCByOjSrbMm2viqy/+5tUpkL4/kK75rzf0uxApzjvGvEx4lTQAa7nxeHoPwuGE
	kPZw+ZX3zZH3Ul5FeAtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6YVj-00000004RM4-42IW;
	Wed, 08 Oct 2025 18:03:35 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6YVi-00000004RL1-00sw
	for linux-riscv@lists.infradead.org;
	Wed, 08 Oct 2025 18:03:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6909E4542D;
	Wed,  8 Oct 2025 18:03:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8BEFC4CEE7;
	Wed,  8 Oct 2025 18:03:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759946612;
	bh=bk9IcjsHAjzeJKGBFPktoeUaQP11TRdKWiSa2+VXBlQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=dx+dIQQzzrPrjzc3YL4EPNcRyBiKa2njtZZ6BGwMFZQsLAGeHFOOMSRzuX+tAZQlA
	 nSkCy+SBJI7Bv0G16kLyo6RTkSWn1jX07CeMox1sy4G+genE1WW7TUoEUFD7f13dBS
	 BfAxs1KL9/ijVwN8RYg3K10xy4bYpZGqKC5T5kBkDCPw2h1NaqJsvhueO5+ByzabwM
	 RwoXq3lLAGScv8s78GPON4iwa5CjinDj3/uqtNdXENvU0LIUSPsxbnQKIe53iCEckW
	 /1x90dhBgwHiIVy/HdCsaq5xV0Jr5yhMYvx1/nGuXVg2mBKNtC2r2gk9UlmcNXrqOL
	 ZjirW+A0OWOUw==
Date: Wed, 8 Oct 2025 12:03:31 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: Florian Schmaus <flo@geekplace.eu>
cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
    Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
    linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: entry: fix typo in comment 'instruciton' ->
 'instruction'
In-Reply-To: <20251006093742.53925-1-flo@geekplace.eu>
Message-ID: <66981f70-e036-c6a9-3ea0-90b3bcdd4be6@kernel.org>
References: <20251006093742.53925-1-flo@geekplace.eu>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251008_110334_082888_3352D288 
X-CRM114-Status: UNSURE (   6.74  )
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

On Mon, 6 Oct 2025, Florian Schmaus wrote:

> Signed-off-by: Florian Schmaus <flo@geekplace.eu>

Please don't forget to run checkpatch.pl on your patches before sending 
them; it would have caught the lack of a commit message.

I wrote a one-line patch description and queued it for 
early v6.18-rc; thanks.  


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
