Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D694CAC5B8
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Oct 2025 07:58:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=9v0kmJhoNivuzy5oz0ZtAumI5B63Pk7daDudNiKfOIo=; b=LuxfTVa40O1zUq
	9z2BdK2X3eEVnPHE+zJZ/6APy3gGNt8JtxIf2Fo1zyekRy/AHacCdMws2uaxGU+Fz/O3FPHHfiMt/
	T6eUt0CUsFDxcelWm7z37DW8Ie36D+0BpYimep9yXlzXEx0UK7oydqzIBqaYgmzp47uWAEzIbOiuw
	vgUQeWYsHxK7IKmkDq3m+9MIpLbkPv/TfgfNQJzLiLe3BBl7oI+cAaFXFg2sCaD0zVdZzzeIp86nc
	Yh2cpoyVefjbxrs9sptUxVzGDN2q9oJIDKY3w66GShJ/TMAu99dYt44QhKFsJ8Lfsa+GJekYASLIN
	DNE16B+VyW+qifAP8xiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5g6k-0000000H9QC-1qiw;
	Mon, 06 Oct 2025 07:58:10 +0000
Received: from mail.proventix.pl ([51.195.118.1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5g6h-0000000H9Ps-1hfw
	for linux-riscv@lists.infradead.org;
	Mon, 06 Oct 2025 07:58:08 +0000
Received: by mail.proventix.pl (Postfix, from userid 1002)
	id CC404A44F1; Mon,  6 Oct 2025 09:56:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=proventix.pl; s=mail;
	t=1759737482; bh=jxb0oDMobd7GaIcoqojTSF8ZoNcoVg4kM8ohJkoHKb8=;
	h=Date:From:To:Subject:From;
	b=uHUKV84PyMze0CB1BuzlBbarBzAb++McTIbqRMaLGqNP96zIWDjdN3z5zaJtnBRHU
	 ISJFYS/5km3ZftH2o8zUcb9xpjCVwKcRUKkQqubEIcXxYyvKAtiHuWVSFb8bMoU/hv
	 MqADDtz/0NdHtMWT0gcSgWQP+x0yUvahxEUIoPmg+YC4JCAZgOJYKOLGPF5AxEiGU7
	 Ag69F+xcsMqKluphYsY1lqFucHlINZjRnejZj0y+h3pOU0wM/LXH/qWcY7ITfwzDe9
	 98cwY1oKPC4xeoDfRyszc7RKXcBVXlYy4/7txFswrZ1xiJ88/loJ5G8KJyITkBVRUf
	 VgiW77qOFiUMQ==
Received: by mail.proventix.pl for <linux-riscv@lists.infradead.org>; Mon,  6 Oct 2025 07:55:45 GMT
Message-ID: <20251006084500-0.1.ob.3dfkj.0.mdcceewpan@proventix.pl>
Date: Mon,  6 Oct 2025 07:55:45 GMT
From: "Adrian Liszka" <adrian.liszka@proventix.pl>
To: <linux-riscv@lists.infradead.org>
Subject: =?UTF-8?Q?Prosz=C4=99_o_kontakt?=
X-Mailer: mail.proventix.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251006_005807_746763_DB9E402C 
X-CRM114-Status: UNSURE (   0.12  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

RHppZcWEIGRvYnJ5LAoKQ3p5IGplc3QgbW/FvGxpd2/Fm8SHIG5hd2nEhXphbmlhIHdzcMOzxYJw
cmFjeSB6IFBhxYRzdHdlbT8KClogY2jEmWNpxIUgcG9yb3ptYXdpYW0geiBvc29ixIUgemFqbXVq
xIVjxIUgc2nEmSBkemlhxYJhbmlhbWkgendpxIV6YW55bWkgemUgc3ByemVkYcW8xIUuCgpQb21h
Z2FteSBza3V0ZWN6bmllIHBvenlza2l3YcSHIG5vd3ljaCBrbGllbnTDs3cuCgpaYXByYXN6YW0g
ZG8ga29udGFrdHUuCgoKWiBwb3pkcm93aWVuaWFtaQpBZHJpYW4gTGlzemthCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5n
IGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
