Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E92CC4332F
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Nov 2022 23:30:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LiISxZjNX4ZHmqvedo+jAJIkdzX/ObNA0+x/s4lI52g=; b=JcsIFxTukEX8Oh
	vD2jwMPaiphAnpgSlWV0PFF3N9yyN4Hxe2tTOr5rvh0iN5WzOmhiRBsHu/1RYvPbXS2Z5Ft/P0rnC
	ndW2MP500Be7px18kgVnW69ZALX+/u8FO9j/JEXulWBnOO8nTxsf2eTJmI2eoULvx+C2tC1WjrGGU
	pK9bz+fJByx8qnAlwFTI0SB/d98PKARG+KFE+s1WY3TGg4U8Pl+5/lfaOeZku7Rs5TK8I8g1r4HZR
	hHRFCUeKOrX5UHSPe+DpK5efrypZcEUhqL57uIOfu1aLnDIKadCgFKwuPuDbmLv01Ha3CxvkpV23k
	tsLlUBQBYanwCyW7O86Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovoKq-000eVg-Nf; Thu, 17 Nov 2022 23:30:20 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovoKo-000eVK-8O
	for linux-riscv@lists.infradead.org; Thu, 17 Nov 2022 23:30:19 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id EE667622A6;
	Thu, 17 Nov 2022 23:30:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4F31CC433D6;
	Thu, 17 Nov 2022 23:30:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668727816;
	bh=FhiyCof4/fOvLHe+Xa1w/QZuG5s46sbjoPQRXM8h11k=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=TKXWYBPuhOeul+mRoD6TrcBJXnt+/FfgfeV30/QnD0jolKO6fRH+qVyF6guIxsRD2
	 tJirBNNGnKfuqn47ID8fQMlCXtGd/z3rrpLRoDqnN31tSgDgr/U1aJchOKmOHhbPbD
	 FkT2G9pBzkvtvwdfBhNixLzehQ3zhapXlheDlm+qCuocn+N15fmQX3hp0vbrKrReWI
	 iuOfmYw3enbNJgOalpaxdGGJxNukutJiazGtwflNVYbMKiwYL8XqBL9TKM18A/sNV5
	 AB9RDqbc0BQ1E+2NFJo553mNvDFgQHN9gw6+8WsbpTpovdlywo7MWtc9wd9n1RpnSL
	 9DHxOdEUrNe1g==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 36A51E21EFA;
	Thu, 17 Nov 2022 23:30:16 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH bpf 1/2] selftests/bpf: Explicitly pass RESOLVE_BTFIDS to
 sub-make
From: patchwork-bot+netdevbpf@kernel.org
Message-Id:  <166872781621.28336.4991961626759200885.git-patchwork-notify@kernel.org>
Date: Thu, 17 Nov 2022 23:30:16 +0000
References: <20221115182051.582962-1-bjorn@kernel.org>
In-Reply-To: <20221115182051.582962-1-bjorn@kernel.org>
To: =?utf-8?b?QmrDtnJuIFTDtnBlbCA8Ympvcm5Aa2VybmVsLm9yZz4=?=@ci.codeaurora.org
Cc: bpf@vger.kernel.org, andrii@kernel.org, ast@kernel.org,
 daniel@iogearbox.net, bjorn@rivosinc.com, linux-riscv@lists.infradead.org,
 netdev@vger.kernel.org, anders.roxell@linaro.org, mykolal@fb.com,
 linux-kselftest@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221117_153018_356986_3A65FBBE 
X-CRM114-Status: UNSURE (   8.98  )
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

SGVsbG86CgpUaGlzIHNlcmllcyB3YXMgYXBwbGllZCB0byBicGYvYnBmLW5leHQuZ2l0IChtYXN0
ZXIpCmJ5IEFuZHJpaSBOYWtyeWlrbyA8YW5kcmlpQGtlcm5lbC5vcmc+OgoKT24gVHVlLCAxNSBO
b3YgMjAyMiAxOToyMDo1MCArMDEwMCB5b3Ugd3JvdGU6Cj4gRnJvbTogQmrDtnJuIFTDtnBlbCA8
Ympvcm5Acml2b3NpbmMuY29tPgo+IAo+IFdoZW4gY3Jvc3MtY29tcGlsaW5nIHNlbGZ0ZXN0cy9i
cGYsIHRoZSByZXNvbHZlX2J0ZmlkcyBiaW5hcnkgZW5kIHVwCj4gaW4gYSBkaWZmZXJlbnQgZGly
ZWN0b3J5LCB0aGFuIHRoZSByZWd1bGFyIHJlc29sdmVfYnRmaWRzCj4gYnVpbGRzLiBQb3B1bGF0
ZSBSRVNPTFZFX0JURklEUyBmb3Igc3ViLW1ha2UsIHNvIGl0IGNhbiBmaW5kIHRoZQo+IGJpbmFy
eS4KPiAKPiBbLi4uXQoKSGVyZSBpcyB0aGUgc3VtbWFyeSB3aXRoIGxpbmtzOgogIC0gW2JwZiwx
LzJdIHNlbGZ0ZXN0cy9icGY6IEV4cGxpY2l0bHkgcGFzcyBSRVNPTFZFX0JURklEUyB0byBzdWIt
bWFrZQogICAgaHR0cHM6Ly9naXQua2VybmVsLm9yZy9icGYvYnBmLW5leHQvYy9jNDUyNWYwNWNh
M2MKICAtIFticGYsMi8yXSBzZWxmdGVzdHMvYnBmOiBQYXNzIHRhcmdldCB0cmlwbGUgdG8gZ2V0
X3N5c19pbmNsdWRlcyBtYWNybwogICAgaHR0cHM6Ly9naXQua2VybmVsLm9yZy9icGYvYnBmLW5l
eHQvYy85OGIyYWZjOGE2N2YKCllvdSBhcmUgYXdlc29tZSwgdGhhbmsgeW91IQotLSAKRGVldC1k
b290LWRvdCwgSSBhbSBhIGJvdC4KaHR0cHM6Ly9rb3JnLmRvY3Mua2VybmVsLm9yZy9wYXRjaHdv
cmsvcHdib3QuaHRtbAoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXJpc2N2Cg==
