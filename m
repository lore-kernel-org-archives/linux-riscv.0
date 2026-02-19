Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86652E9A04C
	for <linux-riscv@archiver.kernel.org>; Thu, 19 Feb 2026 08:05:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EHudbKayVTVVqxJhNX2Ll3zwl/zmMNita3jIyjimtoQ=; b=hTbBFpQe8eIspz
	a2syZAi3E2uN5Uev77J203zREJDcACVDi3+ViDMFGxoTlvQWOWucxcsFpynPSlPNwOfizaRT6FUFx
	OhGKFx8NQ0P/ajg8Z136/04dZmnq4G/9OEWfAnHrEe27bgWjz4onq1hVMYGJ1Clr886a6urkRbDaM
	LTM/3y80RCB69/sgc+4wvNN0rYK1oWKBb6eizpVAceMJTx33YIJgsipa5ufX98wLXI5Ly2RSRE7aQ
	E6XOI7UYqUU8Wgfk823hn4NW/NcRtGbkKN9Oy4bPBJfsr90UF+fJDBQ4XYfMfV9i4aMS34tlKDOt5
	y+4Ql73xyhxwAYN6vDgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsz24-0000000B5ei-3gZO;
	Thu, 19 Feb 2026 08:05:08 +0000
Received: from sender4-op-o15.zoho.com ([136.143.188.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsz22-0000000B5eO-0w0k
	for linux-riscv@lists.infradead.org;
	Thu, 19 Feb 2026 08:05:07 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1771488293; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=ikjtOb3oX1EgHtdw2QAxqKYlVneQSwVpL0ucVwHo2BOn3HB/94myWhKMGQINXwdpOZK3npc4LWXT0YMSrQirMOoIz+sEXFjEdql88wfXp64KGkhIeNFuy7DLDj9rvmm2PWm5g2SNYv/JXH3pBME1YFe7gkhQJ6g4f2N7Z6ohgeM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1771488293; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=kYQ5NkddKGLVG7KXnc5tVWiA8oqeInGD+WTRnEtYdQ0=; 
	b=ca1PRjshbgl0kblWXlxZYjxLz4+EjGHd7r3vw5HoWB6wxiDrLsM3QC5vaKvKz7Clyg5R1kKeapY94Kb4FWBEyZbGPhhgYGjlOgmQXF9gU2aPZ0B26sB778xsKw693Dk8mkTwyV8ivBeFNMZc7EYzJJ10UxCBdOWLTdQ+Sh0piFk=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=ziyao.cc;
	spf=pass  smtp.mailfrom=me@ziyao.cc;
	dmarc=pass header.from=<me@ziyao.cc>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1771488293;
	s=zmail; d=ziyao.cc; i=me@ziyao.cc;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=kYQ5NkddKGLVG7KXnc5tVWiA8oqeInGD+WTRnEtYdQ0=;
	b=QevocWd9wnFpbz6v8KCBM++Ys6nV8e156lzrioDP5AuZwNKDcNaawITAAg98QsGk
	Kb2uKNno6Tg11FVRfVCyTILiEQN1MdAM79iW7HpvdQ+22Qf+5kenHshvDOppuegxWjr
	7d1YgfTJOZuj6xEGdtMUB56dClW92AivaTYOIfLU=
Received: by mx.zohomail.com with SMTPS id 1771488291848192.88439580319414;
	Thu, 19 Feb 2026 00:04:51 -0800 (PST)
Date: Thu, 19 Feb 2026 08:04:42 +0000
From: Yao Zi <me@ziyao.cc>
To: guoren@kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com,
	alex@ghiti.fr, leobras@redhat.com, djordje.todorovic@htecgroup.com,
	aleksa.paunovic@htecgroup.com, arnd@arndb.de, rabenda.cn@gmail.com
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org, Han Gao <gaohan@iscas.ac.cn>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Paul Walmsley <pjw@kernel.org>
Subject: Re: [PATCH V3] riscv: errata: Add ERRATA_THEAD_WRITE_ONCE fixup
Message-ID: <aZbEGsqXSQzORQ__@pie>
References: <20260125063941.443777-1-guoren@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260125063941.443777-1-guoren@kernel.org>
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260219_000506_338073_85EE5BD0 
X-CRM114-Status: GOOD (  14.57  )
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

On Sun, Jan 25, 2026 at 01:39:41AM -0500, guoren@kernel.org wrote:
> From: "Guo Ren (Alibaba DAMO Academy)" <guoren@kernel.org>
> 
> The early version of XuanTie C910 core has a store merge buffer
> delay problem. The store merge buffer could improve the store queue
> performance by merging multi-store requests, but when there are not
> continued store requests, the prior single store request would be
> waiting in the store queue for a long time. That would cause
> significant problems for communication between multi-cores. This
> problem was found on sg2042 & th1520 platforms with the qspinlock
> lock torture test.
> 
> So appending a fence w.o could immediately flush the store merge
> buffer and let other cores see the write result.
> 
> This will apply the WRITE_ONCE errata to handle the non-standard
> behavior via appending a fence w.o instruction for WRITE_ONCE().
> 
> This problem is only observed on the sg2042 hardware platform by
> running the lock_torture test program for half an hour. The problem
> was not found in the user space application, because interrupt can
> break the livelock.
> 
> Reviewed-by: Leonardo Bras <leobras@redhat.com>
> Tested-by: Han Gao <gaohan@iscas.ac.cn>
> Cc: Yao Zi <me@ziyao.cc>
> Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
> Cc: Paul Walmsley <pjw@kernel.org>
> Signed-off-by: Guo Ren (Alibaba DAMO Academy) <guoren@kernel.org>

With the patch, I've run heavy multi-core compilation load on SG2042 for
more than 12 hours, and observed no stability issues.

Tested-by: Yao Zi <me@ziyao.cc>

Thanks,
Yao Zi

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
