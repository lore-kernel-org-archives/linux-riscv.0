Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B796C77B70
	for <linux-riscv@archiver.kernel.org>; Tue, 11 Apr 2023 17:40:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0UXED45GFQTI5jCvVY6uczFFj4SPrMhEB57glcxD+IU=; b=PZSpj5EVEma9TY
	0RRuexIrYapa9IkGtUsfKOR8ZCe2opMxnrRYI6E8lydh74ZncstPkPdodduD6UrPgPvKP+h/BSUxE
	PBScn3pt0Q+5cO/1ObdDLIkfeQzxEj1/LIXCU7jxtFSNSh/g4ncTZ7za9lfCz2Tk+QT4rKOwt2v6O
	AvwtI0xCrv97O1aKXE87BdmRRjUno5QL2IJO38JG9HnjK763GVgB64teYcxPLo+I4EJKocSXRkltS
	CaEeZOCjhDb07r8Q2Qo9denkjwxynCKnY0KD9ZYp1/Gx+M7M25+pVS8M6LlOGEgA/T7d3BHl8Uk6U
	xaYcZDRszKgE3yq6jUuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmHyh-000jYR-2i;
	Tue, 11 Apr 2023 17:40:23 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pmHyf-000jXg-0y
	for linux-riscv@lists.infradead.org;
	Tue, 11 Apr 2023 17:40:22 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 68EF66274F;
	Tue, 11 Apr 2023 17:40:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id BF445C433EF;
	Tue, 11 Apr 2023 17:40:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681234819;
	bh=GZtan0aDYvfz7S+nGDKHusjvrOkU9PdTjM5nSWbDxz8=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=JtrAAs0lnFbUIMDj3IZUpBkAkbkQyNgDo8Rp209XcouyE0H5f5LLUzhgos5gWBsvg
	 H43PILTKuVw4X7L5jvBv/TD8hb7sFnSo/kIpMnbW/ZV1TctjFf7LAIwRP0x5Fv7ABl
	 mp0FsGPyiIKdtXMqJLkJ9KxoxOgsKl5rP6zSY4MDyPUALweuJpChJHhG331nTj0ZXn
	 JP4NVF2FtvgroP65nmUgTiLEf2wOqs1uluSvl0gMftLOq1iYqR3x/IVU7Y70RaffBS
	 CWvgyMmMDQXS2+8/5OEpwVoqs1FmTjq/j0dezJOCtpwZ0J9lNVoDe1MZvFy/I3zJn5
	 kP1VvvYp5nrTg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 98D70E52443;
	Tue, 11 Apr 2023 17:40:19 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] riscv: entry: Save a0 prior syscall_enter_from_user_mode()
From: patchwork-bot+linux-riscv@kernel.org
Message-Id:  <168123481962.28886.3531781273059476912.git-patchwork-notify@kernel.org>
Date: Tue, 11 Apr 2023 17:40:19 +0000
References: <20230403065207.1070974-1-bjorn@kernel.org>
In-Reply-To: <20230403065207.1070974-1-bjorn@kernel.org>
To: =?utf-8?b?QmrDtnJuIFTDtnBlbCA8Ympvcm5Aa2VybmVsLm9yZz4=?=@ci.codeaurora.org
Cc: linux-riscv@lists.infradead.org, aou@eecs.berkeley.edu,
 paul.walmsley@sifive.com, palmer@dabbelt.com, guoren@linux.alibaba.com,
 bjorn@rivosinc.com, heiko@sntech.de, conor@kernel.org, zouyipeng@huawei.com,
 linux-kernel@vger.kernel.org, palmer@rivosinc.com, heiko.stuebner@vrull.eu
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230411_104021_395879_955CD5EE 
X-CRM114-Status: UNSURE (   9.75  )
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

SGVsbG86CgpUaGlzIHBhdGNoIHdhcyBhcHBsaWVkIHRvIHJpc2N2L2xpbnV4LmdpdCAoZm9yLW5l
eHQpCmJ5IFBhbG1lciBEYWJiZWx0IDxwYWxtZXJAcml2b3NpbmMuY29tPjoKCk9uIE1vbiwgIDMg
QXByIDIwMjMgMDg6NTI6MDcgKzAyMDAgeW91IHdyb3RlOgo+IEZyb206IEJqw7ZybiBUw7ZwZWwg
PGJqb3JuQHJpdm9zaW5jLmNvbT4KPiAKPiBUaGUgUklTQy1WIGNhbGxpbmcgY29udmVudGlvbiBw
YXNzZXMgdGhlIGZpcnN0IGFyZ3VtZW50LCBhbmQgdGhlCj4gcmV0dXJuIHZhbHVlIGluIHRoZSBh
MCByZWdpc3Rlci4gRm9yIHRoaXMgcmVhc29uLCB0aGUgYTAgcmVnaXN0ZXIKPiBuZWVkcyBzb21l
IGV4dHJhIGNhcmU7IFdoZW4gaGFuZGxpbmcgc3lzY2FsbHMsIHRoZSBhMCByZWdpc3RlciBpcwo+
IHNhdmVkIGludG8gcmVncy0+b3JpZ19hMCwgc28gYTAgY2FuIGJlIHByb3Blcmx5IHJlc3RvcmVk
IGZvciwKPiBlLmcuIGludGVycnVwdGVkIHN5c2NhbGxzLgo+IAo+IFsuLi5dCgpIZXJlIGlzIHRo
ZSBzdW1tYXJ5IHdpdGggbGlua3M6CiAgLSByaXNjdjogZW50cnk6IFNhdmUgYTAgcHJpb3Igc3lz
Y2FsbF9lbnRlcl9mcm9tX3VzZXJfbW9kZSgpCiAgICBodHRwczovL2dpdC5rZXJuZWwub3JnL3Jp
c2N2L2MvOWMyNTk4ZDQzNTEwCgpZb3UgYXJlIGF3ZXNvbWUsIHRoYW5rIHlvdSEKLS0gCkRlZXQt
ZG9vdC1kb3QsIEkgYW0gYSBib3QuCmh0dHBzOi8va29yZy5kb2NzLmtlcm5lbC5vcmcvcGF0Y2h3
b3JrL3B3Ym90Lmh0bWwKCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1yaXNjdgo=
