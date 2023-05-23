Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DA95C7EE23
	for <linux-riscv@archiver.kernel.org>; Tue, 23 May 2023 13:45:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=riV+Cr8m18HWXhG4mWTFphRmhQmxKD58X44cJW5A8tA=; b=1bSWOnVWi2cJRy
	knqy9SQwNBgnQcUOBJ08iu/j3640T29obSIviEc5pQilb1iF8dPkgAaESrpmKHoG5LQYh59kyp5zI
	h0TXBC/m+VCxBIsSpOgHEQ6g8Mmkt9JQjolaCsqpdYjf7OV1gXQJjtZvCBZvAx83PdIxHLTlOW1Gw
	hUHYp2U+oBMpGhfxeeQ2xUp9lbZcgfma8GFgtf13sDjqSkfXVj/SUXd4OQ1jMObyW4QrK9ZLNYy3z
	TnT/vjLVR/ZyEGL6DlL4gNVw+qvFPFUFa/d2UqDtTm7OL960lt/YrNcWzRIwxGPV+JUdzdEmgxFwo
	cWFmUep6+3l4U5BzsJSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q1SKh-00APCk-1z;
	Tue, 23 May 2023 13:45:47 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q1SKe-00APBb-1l;
	Tue, 23 May 2023 13:45:45 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 6480F632A4;
	Tue, 23 May 2023 13:45:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 543C7C4339C;
	Tue, 23 May 2023 13:45:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684849542;
	bh=ETJcP1r57z0YzI21dRpkzECXtCN17+uNlMT7Hv4M6F8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=f923UW09WKDPNspjcv5xj7oJnXWo210SE3L1Aem6JnPzcyiaDY7Fd6uW7ERkCz9dI
	 n2nwVgfzhbsmzeG7SBeDs9cKqWZ3tB73w3umDeEGuDjqAy5857nTv3uynT4QoS/0b8
	 ZLpEv/gxWDoGRunaG1K2naK2cKlt8KIzHBmLdxXI97c6mr/dU9adlQyp1s0kIp2XKS
	 81Sp7pBxvUswjvdOPhs4a8Sc9pYYYTwNfbVcaY3ANdOhGvJn/4Jqughy/tmRQqU1X6
	 y5C3kYiqzvhESOhhprySdZu+DzhAZ1lz1WvxxrQhWixlzPxxPaElxtTdiCvo+r1D2f
	 Dxzl67BNTx83A==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Andy Chiu <andy.chiu@sifive.com>, linux-riscv@lists.infradead.org,
 palmer@dabbelt.com, anup@brainfault.org, atishp@atishpatra.org,
 kvm-riscv@lists.infradead.org, kvm@vger.kernel.org
Cc: vineetg@rivosinc.com, greentime.hu@sifive.com, guoren@linux.alibaba.com,
 Andy Chiu <andy.chiu@sifive.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>, Vincent
 Chen <vincent.chen@sifive.com>, Guo Ren <guoren@kernel.org>, Heiko
 Stuebner <heiko.stuebner@vrull.eu>
Subject: Re: [PATCH -next v20 21/26] riscv: Add sysctl to set the default
 vector rule for new processes
In-Reply-To: <20230518161949.11203-22-andy.chiu@sifive.com>
References: <20230518161949.11203-1-andy.chiu@sifive.com>
 <20230518161949.11203-22-andy.chiu@sifive.com>
Date: Tue, 23 May 2023 15:45:40 +0200
Message-ID: <87wn0zb1q3.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230523_064544_623452_09F90C52 
X-CRM114-Status: GOOD (  13.27  )
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

QW5keSBDaGl1IDxhbmR5LmNoaXVAc2lmaXZlLmNvbT4gd3JpdGVzOgoKPiBUbyBzdXBwb3J0IFZl
Y3RvciBleHRlbnNpb24sIHRoZSBzZXJpZXMgZXhwb3J0cyB2YXJpYWJsZS1sZW5ndGggdmVjdG9y
Cj4gcmVnaXN0ZXJzIG9uIHRoZSBzaWduYWwgZnJhbWUuIEhvd2V2ZXIsIHRoaXMgcG90ZW50aWFs
bHkgYnJlYWtzIGFiaSBpZgo+IHByb2Nlc3NpbmcgdmVjdG9yIHJlZ2lzdGVycyBpcyByZXF1aXJl
ZCBpbiB0aGUgc2lnbmFsIGhhbmRsZXIgZm9yIG9sZAo+IGJpbmFyaWVzLiBGb3IgZXhhbXBsZSwg
dGhlcmUgaXMgc3VjaCBuZWVkIGlmIHVzZXItbGV2ZWwgY29udGV4dCBzd2l0Y2gKPiBpcyB0cmln
Z2VycmVkIHZpYSBzaWduYWxzWzFdLgo+Cj4gRm9yIHRoaXMgcmVhc29uLCBpdCBpcyBiZXN0IHRv
IGxlYXZlIGEgZGVjaXNpb24gdG8gZGlzdHJvIG1haW50YWluZXJzLAo+IHdoZXJlIHRoZSBlbmFi
bGVtZW50IG9mIHVzZXJzcGFjZSBWZWN0b3IgZm9yIG5ldyBsYXVuY2hpbmcgcHJvZ3JhbXMgY2Fu
Cj4gYmUgY29udHJvbGxlZC4gRGV2ZWxvcGVycyBtYXkgYWxzbyBuZWVkIHRoZSBzd2l0Y2ggdG8g
ZXhwZXJpbWVudCB3aXRoLgo+IFRoZSBwYXJhbWV0ZXIgaXMgY29uZmlndXJhYmxlIHRocm91Z2gg
c3lzY3RsIGludGVyZmFjZSBzbyBhIGRpc3RybyBtYXkKPiB0dXJuIG9mZiBWZWN0b3IgZWFybHkg
YXQgaW5pdCBzY3JpcHQgaWYgdGhlIGJyZWFrIHJlYWxseSBoYXBwZW5zIGluIHRoZQo+IHdpbGQu
Cj4KPiBUaGUgc3dpdGNoIHdpbGwgb25seSB0YWtlIGVmZmVjdHMgb24gbmV3IGV4ZWN2ZSgpIGNh
bGxzIG9uY2Ugc2V0LiBUaGlzCj4gd2lsbCBub3QgZWZmZWN0IGV4aXN0aW5nIHByb2Nlc3NlcyB0
aGF0IGRvIG5vdCBjYWxsIGV4ZWN2ZSgpLCBub3IKPiBwcm9jZXNzZXMgd2hpY2ggaGFzIGJlZW4g
c2V0IHdpdGggYSBub24tZGVmYXVsdCB2c3RhdGVfY3RybCBieSBtYWtpbmcKPiBleHBsaWNpdCBQ
Ul9SSVNDVl9WX1NFVF9DT05UUk9MIHByY3RsKCkgY2FsbHMuCj4KPiBMaW5rOiBodHRwczovL2xv
cmUua2VybmVsLm9yZy9hbGwvODdjejQwNDhycC5mc2ZAYWxsLnlvdXIuYmFzZS5hcmUuYmVsb25n
LnRvLnVzLwo+IFNpZ25lZC1vZmYtYnk6IEFuZHkgQ2hpdSA8YW5keS5jaGl1QHNpZml2ZS5jb20+
Cj4gUmV2aWV3ZWQtYnk6IEdyZWVudGltZSBIdSA8Z3JlZW50aW1lLmh1QHNpZml2ZS5jb20+Cj4g
UmV2aWV3ZWQtYnk6IFZpbmNlbnQgQ2hlbiA8dmluY2VudC5jaGVuQHNpZml2ZS5jb20+Cj4gLS0t
Cj4gQ2hhbmdlbG9nIHYyMDoKPiAgLSBVc2UgUkVBRF9PTkNFIHRvIGFjY2VzcyByaXNjdl92X2lt
cGxpY2l0X3VhY2MgKEJqw7ZybikKClJldmlld2VkLWJ5OiBCasO2cm4gVMO2cGVsIDxiam9ybkBy
aXZvc2luYy5jb20+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJp
c2N2Cg==
