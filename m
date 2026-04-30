Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00E91CD1297
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Apr 2026 03:26:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=i9gCT3TeMaTOPfepz4tkoqlhyLkjt0JyHrL/podeo5w=; b=I8VU6ONPYUhYxl
	K4X3WNuSLv90Ryq1ifJUxjaPH8aKBenGajGCfpD/wemdAY/UX6lvDUpQdDS6VJabv3RGMmojGehhj
	2rI82YVVJNsPTp8ZMZA0Ep9whNi83wPAhfTYMQrKl1em5ai811VM0oGnGcYw+12pqcowEfBkMYyHh
	hiGgK8TzJDFPO2R4r6bTgWqb75fySC6TxkOmaAOZ4tVBVRDClyPEpnsNCG5Venxrah+r9SmTc8ZY8
	fxBnnj9YiWAHWd5hX0wuWkL4uZcjAppzZeRsc79NxX/yaTKS+lXvsF5EEoHYju+wBaUaocmfq65S+
	s8iI66oFPT8vob3UnMOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wII2N-00000004WTa-0FTO;
	Thu, 30 Apr 2026 03:26:03 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wII2C-00000004WNQ-12Ov
	for linux-riscv@lists.infradead.org;
	Thu, 30 Apr 2026 03:25:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id ABBA161340;
	Thu, 30 Apr 2026 03:25:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62CFEC2BCC7;
	Thu, 30 Apr 2026 03:25:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777519551;
	bh=iw/+bVd64D6nV9To0nB8RmieQUpDk08Uo3ctpnYqCr0=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=gBsvH9x+SIOgq9UApAhLWz5RiMzbifmJXpdkeP2yXKmnNP0dnCBbk+WqU7FqgSMHS
	 cUp8KLOmN5ablPQjnKS9MDIkY5YMamDdgDqhaPfnbq1q1gFDmezkpAVTwaKYmwz38p
	 Q0QE0zlgD1tGGfsQJgcTIGwI3TKwLqXUFoXGRX/8BMVhQ/fDg7VV1dregeTwfvZPKX
	 P0/QwlmjK6FJFgnfJF4JItSUBljnwVDQC3ixKmRHO7lQApz6NDKWu8kl3NanDHyzfp
	 zotOC5tpQwnoZROYD01LoAP1BtdUsfsCYhJhTxDtnJlqJb6NSNq5juk9m1NB+6F/VT
	 RgJp80Mzpdbkg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id BA06B3809A07;
	Thu, 30 Apr 2026 03:25:07 +0000 (UTC)
MIME-Version: 1.0
Subject: Re:
 =?utf-8?q?=5BPATCH=5D_irqchip/riscv-aplic=3A_Restrict_genpd_notifie?=
	=?utf-8?q?r_to_device_tree_only?=
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <177751950629.2274119.11651401425571807899.git-patchwork-notify@kernel.org>
Date: Thu, 30 Apr 2026 03:25:06 +0000
References: <20260331093029749vRpdH-0qoEqjS0Wnn9M4x@zte.com.cn>
In-Reply-To: <20260331093029749vRpdH-0qoEqjS0Wnn9M4x@zte.com.cn>
To: <liu.xuemei1@zte.com.cn>
Cc: linux-riscv@lists.infradead.org, anup@brainfault.org, tglx@kernel.org,
 pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
 nick.hu@sifive.com, liujingqi@lanxincomputing.com, yongxuan.wang@sifive.com,
 linux-kernel@vger.kernel.org
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

SGVsbG86CgpUaGlzIHBhdGNoIHdhcyBhcHBsaWVkIHRvIHJpc2N2L2xpbnV4LmdpdCAoZml4ZXMp
CmJ5IFRob21hcyBHbGVpeG5lciA8dGdseEBrZXJuZWwub3JnPjoKCk9uIFR1ZSwgMzEgTWFyIDIw
MjYgMDk6MzA6MjkgKzA4MDAgKENTVCkgeW91IHdyb3RlOgo+IEZyb206IEplc3NpY2EgTGl1IDxs
aXUueHVlbWVpMUB6dGUuY29tLmNuPgo+IAo+IE9uIEFDUEkgc3lzdGVtcywgdGhlIGFwbGljJ3Mg
cG1fZG9tYWluIGlzIHNldCB0bwo+IGFjcGlfZ2VuZXJhbF9wbV9kb21haW4sIHdoaWNoIHByb3Zp
ZGVzIGl0cyBvd24gcG93ZXIgbWFuYWdlbWVudAo+IGNhbGxiYWNrcyAoZS5nLiwgcnVudGltZV9z
dXNwZW5kIHZpYSBhY3BpX3N1YnN5c19ydW50aW1lX3N1c3BlbmQpLgo+IFRoZSBhcGxpY19wbV9h
ZGQoKSB1bmNvbmRpdGlvbmFsbHkgY2FsbHMgZGV2X3BtX2dlbnBkX2FkZF9ub3RpZmllcigpCj4g
d2hlbiBkZXYtPnBtX2RvbWFpbiBpcyBub27igJFOVUxMLCBsZWFkaW5nIHRvIGEgY29tcGFyaXNv
biBiZXR3ZWVuCj4gcnVudGltZV9zdXNwZW5kIGFuZCBnZW5wZF9ydW50aW1lX3N1c3BlbmQuIFRo
aXMgcmVzdWx0cyBpbiB0aGUKPiBmb2xsb3dpbmcgZXJyb3JzIHdoZW4gQUNQSSBpcyBlbmFibGVk
Ogo+IAo+IFsuLi5dCgpIZXJlIGlzIHRoZSBzdW1tYXJ5IHdpdGggbGlua3M6CiAgLSBpcnFjaGlw
L3Jpc2N2LWFwbGljOiBSZXN0cmljdCBnZW5wZCBub3RpZmllciB0byBkZXZpY2UgdHJlZSBvbmx5
CiAgICBodHRwczovL2dpdC5rZXJuZWwub3JnL3Jpc2N2L2MvYWY0MTZjZDliM2ZiCgpZb3UgYXJl
IGF3ZXNvbWUsIHRoYW5rIHlvdSEKLS0gCkRlZXQtZG9vdC1kb3QsIEkgYW0gYSBib3QuCmh0dHBz
Oi8va29yZy5kb2NzLmtlcm5lbC5vcmcvcGF0Y2h3b3JrL3B3Ym90Lmh0bWwKCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGlu
ZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
