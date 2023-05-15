Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6A01C77B75
	for <linux-riscv@archiver.kernel.org>; Mon, 15 May 2023 11:43:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=v5KsrGP1NsB3KfYkWqavUzFvSASROUsXHp0M9gZe6kk=; b=tX/sHZZQs8nfzR
	O7JBmE+mfQf/MxH2wVXzHJqLk9oiZQ8v12QQzgL6YdXTe0Zz31sq8EENlapVnvcU+du+pM7Td5Xwk
	50xCuseQ1oSLZb5LX6IVPyv/4TYLyuy/HL6q6ESCWE9WGKem6hi9O/SMjiUYFwQ36e/wpGzaP0PCW
	PWysCKhVMg/vYGw3HwU/GCVEbAMc0J7TNKUhA2P5QwHc6iEJx1GIT9e6nK2ELf0N5j8wwjM5zxwYe
	ys+8HFhpAw2mcqDRyjOfDF8Va9A3fNABn8DbcLUDECrsa1ShXDiGa0oUjIYmMBzlBfmkoxpGbmlnw
	3FJfeRIgOBLzwTePrsyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pyWbX-0020sj-1B;
	Mon, 15 May 2023 11:43:03 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pyWbU-0020s5-19;
	Mon, 15 May 2023 11:43:01 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id C32DD612D8;
	Mon, 15 May 2023 11:42:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4039C433EF;
	Mon, 15 May 2023 11:42:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684150979;
	bh=UwXA51cUOqHr2O0y8aV9fxZOLviMaAOAKrM3IfbYbAk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=JH6UYS6CPmMu5V8OzIWZoTX4OoNLrR9CWkSPjGLPU7IkYVRVuJ+zArYgUm0bha0Z2
	 ZA6TyxrHj4OJbjNKEuaNUoLLO383sGJwpTiqF4emj2nyp0KIvqggU77ckohaOTsMcX
	 U5ycecIxk5EqvinxLa9Vj8fUJO4er4/mglb0GVHzXqK42rvTXuoOkA6064a8AL/jj2
	 As2z82Q8DSePHOTqplTBFNzgZtN2lYjtdF4gWqd8a3m+PAGc+3z2O+/fI/8Ln79wbQ
	 /NiV2MH3r1/cjkjE/NkmaF5zuuNfTYBT8KoqaMLvzEvqlU4PaHQF1AxxTGxlNlEKeV
	 dK3lxORxuFBzw==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Andy Chiu <andy.chiu@sifive.com>, linux-riscv@lists.infradead.org,
 palmer@dabbelt.com, anup@brainfault.org, atishp@atishpatra.org,
 kvm-riscv@lists.infradead.org, kvm@vger.kernel.org
Cc: vineetg@rivosinc.com, greentime.hu@sifive.com, guoren@linux.alibaba.com,
 Andy Chiu <andy.chiu@sifive.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>, Vincent
 Chen <vincent.chen@sifive.com>, Heiko Stuebner <heiko.stuebner@vrull.eu>,
 Guo Ren <guoren@kernel.org>
Subject: Re: [PATCH -next v19 21/24] riscv: Add sysctl to set the default
 vector rule for new processes
In-Reply-To: <20230509103033.11285-22-andy.chiu@sifive.com>
References: <20230509103033.11285-1-andy.chiu@sifive.com>
 <20230509103033.11285-22-andy.chiu@sifive.com>
Date: Mon, 15 May 2023 13:42:56 +0200
Message-ID: <87mt25hlbz.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230515_044300_454094_0426DE53 
X-CRM114-Status: GOOD (  18.09  )
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
Cj4gIGFyY2gvcmlzY3Yva2VybmVsL3ZlY3Rvci5jIHwgMzEgKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgMzEgaW5zZXJ0aW9ucygrKQo+Cj4gZGlmZiAt
LWdpdCBhL2FyY2gvcmlzY3Yva2VybmVsL3ZlY3Rvci5jIGIvYXJjaC9yaXNjdi9rZXJuZWwvdmVj
dG9yLmMKPiBpbmRleCAxNmNjYjM1NjI1YTkuLjFjNGFjODIxZTAwOCAxMDA2NDQKPiAtLS0gYS9h
cmNoL3Jpc2N2L2tlcm5lbC92ZWN0b3IuYwo+ICsrKyBiL2FyY2gvcmlzY3Yva2VybmVsL3ZlY3Rv
ci5jCj4gQEAgLTIzMywzICsyMzMsMzQgQEAgdW5zaWduZWQgaW50IHJpc2N2X3ZfdnN0YXRlX2N0
cmxfc2V0X2N1cnJlbnQodW5zaWduZWQgbG9uZyBhcmcpCj4gIAo+ICAJcmV0dXJuIC1FSU5WQUw7
Cj4gIH0KPiArCj4gKyNpZmRlZiBDT05GSUdfU1lTQ1RMCj4gKwo+ICtzdGF0aWMgc3RydWN0IGN0
bF90YWJsZSByaXNjdl92X2RlZmF1bHRfdnN0YXRlX3RhYmxlW10gPSB7Cj4gKwl7Cj4gKwkJLnBy
b2NuYW1lCT0gInJpc2N2X3ZfZGVmYXVsdF9hbGxvdyIsCj4gKwkJLmRhdGEJCT0gJnJpc2N2X3Zf
aW1wbGljaXRfdWFjYywKCk5vdyB0aGF0IHJpc2N2X3ZfaW1wbGljaXRfdWFjYyBjYW4gYmUgY2hh
bmdlZCB2aWEgc3lzY3RsLCBJJ2QgYWRkCmV4cGxpY2l0IFJFQURfT05DRSgpIHRvIHRoZSBhY2Nl
c3NlcyB0byBtYWtlIHJhY2UgY2hlY2tlcnMgaGFwcHkuCgoKQmrDtnJuCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxp
c3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
