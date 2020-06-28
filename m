Return-Path: <SRS0=ohv9=AJ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F04DC433DF
	for <linux-riscv@archiver.kernel.org>; Sun, 28 Jun 2020 14:52:44 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1D3E120772
	for <linux-riscv@archiver.kernel.org>; Sun, 28 Jun 2020 14:52:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="N57poLcN";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="NAQOE0iL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1D3E120772
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:Message-Id:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ucs4+yZfePRHhKPxQjv04xN1x81LnBd5FUczQn3o7fQ=; b=N57poLcNlyGg6Op0jKldfL6T6
	DW1wW7uHoAkaY5RN+IU4yz3UdwbJI1cmCaisFziLhTFhaWsjW43XPFnkYlpoRViVLT7zLvVQFtzZA
	2mihn3BZ4EV/7xFqAniOSNR9QAmNEDSr5MQHA1MjJ+5QphlsedSKLXPjmP3OiTuj1WJwdjiPdWs+C
	04RzVr4gG0HFEZ2coB+Ky4k9HCsnYuSDg4v8lTntJtaW7EaenTX+yrhnpr6z7XSxtn5wB4sECf/jU
	czPjGXcfQojIl9ySnK3csB6SeThHYgPVZeQf3ivIhw83pAvTxbTe5QOvs6retN49EIjb8Xhq72lb/
	46rG+Yz3Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jpYfc-0002AZ-Fg; Sun, 28 Jun 2020 14:52:36 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jpYfY-0002AH-W5
 for linux-riscv@lists.infradead.org; Sun, 28 Jun 2020 14:52:34 +0000
Received: from devnote2 (NE2965lan1.rev.em-net.ne.jp [210.141.244.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 959D920771;
 Sun, 28 Jun 2020 14:52:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1593355952;
 bh=1A1LBF13tY4/QGYiqzjje0lY23s+iMcEMxhBw/Upx94=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=NAQOE0iLfVVPbmiHJhNZeDkjlMGjFMmyGvHcSiHX3U6BiFyDySmTEdggHrg0r+1Rh
 BPpQhMrZE2V3Zo4q0MC1MrTBd9Zdc1Tu0P5UITmL5w/H0yyican7fyTRsKF7e1S0PV
 XtmNgigG+8kaWltXzltG2BnK8s23k2h/h6rgaTpQ=
Date: Sun, 28 Jun 2020 23:52:26 +0900
From: Masami Hiramatsu <mhiramat@kernel.org>
To: Guo Ren <guoren@kernel.org>
Subject: Re: [PATCH] riscv: Fixup compile error BUILD_BUG_ON failed
Message-Id: <20200628235226.dbbe2256ea6e846abfb63feb@kernel.org>
In-Reply-To: <CAJF2gTTCHMHp-+RoG8DoDhbJStzmOf5AK=Z3K26FUmd_hbgR=g@mail.gmail.com>
References: <1593274802-46332-1-git-send-email-guoren@kernel.org>
 <20200628115945.335b92c517cb8a8fa87be759@kernel.org>
 <CAJF2gTTCHMHp-+RoG8DoDhbJStzmOf5AK=Z3K26FUmd_hbgR=g@mail.gmail.com>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
Mime-Version: 1.0
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Guo Ren <guoren@linux.alibaba.com>, Anup Patel <anup@brainfault.org>,
 Palmer Dabbelt <palmerdabbelt@google.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-csky@vger.kernel.org, Zong Li <zong.li@sifive.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Greentime Hu <greentime.hu@sifive.com>,
 linux-riscv <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gU3VuLCAyOCBKdW4gMjAyMCAxNDoxMjowNyArMDgwMApHdW8gUmVuIDxndW9yZW5Aa2VybmVs
Lm9yZz4gd3JvdGU6Cgo+IE9uIFN1biwgSnVuIDI4LCAyMDIwIGF0IDEwOjU5IEFNIE1hc2FtaSBI
aXJhbWF0c3UgPG1oaXJhbWF0QGtlcm5lbC5vcmc+IHdyb3RlOgo+ID4KPiA+IE9uIFNhdCwgMjcg
SnVuIDIwMjAgMTY6MjA6MDIgKzAwMDAKPiA+IGd1b3JlbkBrZXJuZWwub3JnIHdyb3RlOgo+ID4K
PiA+ID4gRnJvbTogR3VvIFJlbiA8Z3VvcmVuQGxpbnV4LmFsaWJhYmEuY29tPgo+ID4gPgo+ID4g
PiBVbmZvcnR1bmF0ZWx5LCB0aGUgY3VycmVudCBjb2RlIGNvdWxkbid0IGJlIGNvbXBpbGVkLCBi
ZWNhdXNlCj4gPiA+IEJVSUxEX0JVR19PTiBuZWVkcyBhIHN0YXRpYyBkZWZpbmVkIHZhbHVlLCBu
b3QgYSBkeW5hbWljCj4gPiA+IHZhcmlhYmxlIHdpdGggYTAgcmVncy4gSnVzdCB1c2UgaXQgaW5s
aW5lIGFzIGEgc29sdXRpb24uCj4gPiA+Cj4gPiA+ICAgQ0MgICAgICBhcmNoL3Jpc2N2L2tlcm5l
bC9wYXRjaC5vCj4gPiA+IEluIGZpbGUgaW5jbHVkZWQgZnJvbSAuL2luY2x1ZGUvbGludXgva2Vy
bmVsLmg6MTEsCj4gPiA+ICAgICAgICAgICAgICAgICAgZnJvbSAuL2luY2x1ZGUvbGludXgvbGlz
dC5oOjksCj4gPiA+ICAgICAgICAgICAgICAgICAgZnJvbSAuL2luY2x1ZGUvbGludXgvcHJlZW1w
dC5oOjExLAo+ID4gPiAgICAgICAgICAgICAgICAgIGZyb20gLi9pbmNsdWRlL2xpbnV4L3NwaW5s
b2NrLmg6NTEsCj4gPiA+ICAgICAgICAgICAgICAgICAgZnJvbSBhcmNoL3Jpc2N2L2tlcm5lbC9w
YXRjaC5jOjY6Cj4gPiA+IEluIGZ1bmN0aW9uIOKAmGZpeF90b192aXJ04oCZLAo+ID4gPiAgICAg
aW5saW5lZCBmcm9tIOKAmHBhdGNoX21hcOKAmSBhdCBhcmNoL3Jpc2N2L2tlcm5lbC9wYXRjaC5j
OjM3OjE3Ogo+ID4gPiAuL2luY2x1ZGUvbGludXgvY29tcGlsZXIuaDozOTI6Mzg6IGVycm9yOiBj
YWxsIHRvIOKAmF9fY29tcGlsZXRpbWVfYXNzZXJ0XzIwNeKAmSBkZWNsYXJlZCB3aXRoIGF0dHJp
YnV0ZSBlcnJvcjogQlVJTERfQlVHX09OIGZhaWxlZDogaWR4ID49IF9fZW5kX29mX2ZpeGVkX2Fk
ZHJlc3Nlcwo+ID4gPiAgIF9jb21waWxldGltZV9hc3NlcnQoY29uZGl0aW9uLCBtc2csIF9fY29t
cGlsZXRpbWVfYXNzZXJ0XywgX19DT1VOVEVSX18pCj4gPiA+ICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgXgo+ID4gPiAuL2luY2x1ZGUvbGludXgvY29tcGlsZXIuaDozNzM6
NDogbm90ZTogaW4gZGVmaW5pdGlvbiBvZiBtYWNybyDigJhfX2NvbXBpbGV0aW1lX2Fzc2VydOKA
mQo+ID4gPiAgICAgcHJlZml4ICMjIHN1ZmZpeCgpOyAgICBcCj4gPiA+ICAgICBefn5+fn4KPiA+
ID4gLi9pbmNsdWRlL2xpbnV4L2NvbXBpbGVyLmg6MzkyOjI6IG5vdGU6IGluIGV4cGFuc2lvbiBv
ZiBtYWNybyDigJhfY29tcGlsZXRpbWVfYXNzZXJ04oCZCj4gPiA+ICAgX2NvbXBpbGV0aW1lX2Fz
c2VydChjb25kaXRpb24sIG1zZywgX19jb21waWxldGltZV9hc3NlcnRfLCBfX0NPVU5URVJfXykK
PiA+ID4gICBefn5+fn5+fn5+fn5+fn5+fn5+Cj4gPiA+IC4vaW5jbHVkZS9saW51eC9idWlsZF9i
dWcuaDozOTozNzogbm90ZTogaW4gZXhwYW5zaW9uIG9mIG1hY3JvIOKAmGNvbXBpbGV0aW1lX2Fz
c2VydOKAmQo+ID4gPiAgI2RlZmluZSBCVUlMRF9CVUdfT05fTVNHKGNvbmQsIG1zZykgY29tcGls
ZXRpbWVfYXNzZXJ0KCEoY29uZCksIG1zZykKPiA+ID4gICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIF5+fn5+fn5+fn5+fn5+fn5+fgo+ID4gPiAuL2luY2x1ZGUvbGludXgvYnVp
bGRfYnVnLmg6NTA6Mjogbm90ZTogaW4gZXhwYW5zaW9uIG9mIG1hY3JvIOKAmEJVSUxEX0JVR19P
Tl9NU0figJkKPiA+ID4gICBCVUlMRF9CVUdfT05fTVNHKGNvbmRpdGlvbiwgIkJVSUxEX0JVR19P
TiBmYWlsZWQ6ICIgI2NvbmRpdGlvbikKPiA+ID4gICBefn5+fn5+fn5+fn5+fn5+Cj4gPiA+IC4v
aW5jbHVkZS9hc20tZ2VuZXJpYy9maXhtYXAuaDozMjoyOiBub3RlOiBpbiBleHBhbnNpb24gb2Yg
bWFjcm8g4oCYQlVJTERfQlVHX09O4oCZCj4gPiA+ICAgQlVJTERfQlVHX09OKGlkeCA+PSBfX2Vu
ZF9vZl9maXhlZF9hZGRyZXNzZXMpOwo+ID4gPiAgIF5+fn5+fn5+fn5+fgo+ID4gPgo+ID4gPiBT
aWduZWQtb2ZmLWJ5OiBHdW8gUmVuIDxndW9yZW5AbGludXguYWxpYmFiYS5jb20+Cj4gPiA+IENj
OiBNYXNhbWkgSGlyYW1hdHN1IDxtaGlyYW1hdEBrZXJuZWwub3JnPgo+ID4gPiBDYzogWm9uZyBM
aSA8em9uZy5saUBzaWZpdmUuY29tPgo+ID4gPiAtLS0KPiA+ID4gIGFyY2gvcmlzY3Yva2VybmVs
L3BhdGNoLmMgfCAzICstLQo+ID4gPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAy
IGRlbGV0aW9ucygtKQo+ID4gPgo+ID4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwv
cGF0Y2guYyBiL2FyY2gvcmlzY3Yva2VybmVsL3BhdGNoLmMKPiA+ID4gaW5kZXggZDRhNjRkZi4u
ZjhlODRmMiAxMDA2NDQKPiA+ID4gLS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwvcGF0Y2guYwo+ID4g
PiArKysgYi9hcmNoL3Jpc2N2L2tlcm5lbC9wYXRjaC5jCj4gPiA+IEBAIC0yMCw3ICsyMCw3IEBA
IHN0cnVjdCBwYXRjaF9pbnNuIHsKPiA+ID4gIH07Cj4gPiA+Cj4gPiA+ICAjaWZkZWYgQ09ORklH
X01NVQo+ID4gPiAtc3RhdGljIHZvaWQgKnBhdGNoX21hcCh2b2lkICphZGRyLCBpbnQgZml4bWFw
KQo+ID4gPiArc3RhdGljIGlubGluZSB2b2lkICpwYXRjaF9tYXAodm9pZCAqYWRkciwgaW50IGZp
eG1hcCkKPiA+Cj4gPiBXb3VsZCB3ZSBiZSBiZXR0ZXIgdG8gdXNlICJfX2Fsd2F5c19pbmxpbmUi
IGFzIHNhbWUgYXMgZml4X3RvX3ZpcnQ/Cj4gT2sKPiAKPiA+IEFuZCBhbHNvLCBjb3VsZCB5b3Ug
YWRkIGEgY29tbWVudCB3aHkgd2UgbmVlZCB0byBtYWtlIGl0IGlubGluZT8KPiBJJ3ZlIG1lbnRp
b25lZCBpbiBjb21tZW50Ogo+ID4gPiBCVUlMRF9CVUdfT04gbmVlZHMgYSBzdGF0aWMgZGVmaW5l
ZCB2YWx1ZSwgbm90IGEgZHluYW1pYwo+ID4gPiB2YXJpYWJsZSB3aXRoIGEwIHJlZ3MuCj4gCj4g
aWR4IG11c3QgYmUgYSBjb25zdCB1bnNpZ25lZCBpbnQgb3IgaXQgd2lsbCBjYXVzZSBjb21waWxl
IGVycm9yIHdpdGgKPiBCVUlMRF9CVUdfT04uCgpBaCwgc29ycnkgZm9yIHRoZSBjb25mdXNpb24u
IEkgbWVhbnQgdGhlIGNvbW1lbnQgbGluZSBpbiB0aGUgY29kZS4KQlRXLCBjYW4gd2UgYWxzbyB1
c2UgImNvbnN0IHVuc2lnbmVkIGludCIgZm9yIHRoZSBmaXhtYXAgaW5kZXggc28gdGhhdApubyBv
bmUgbWlzcyBpdCBhbnltb3JlPwoKVGhhbmsgeW91LAoKPiAKPiAvKgo+ICAqICdpbmRleCB0byBh
ZGRyZXNzJyB0cmFuc2xhdGlvbi4gSWYgYW55b25lIHRyaWVzIHRvIHVzZSB0aGUgaWR4Cj4gICog
ZGlyZWN0bHkgd2l0aG91dCB0cmFuc2xhdGlvbiwgd2UgY2F0Y2ggdGhlIGJ1ZyB3aXRoIGEgTlVM
TC1kZWZlcmVuY2UKPiAgKiBrZXJuZWwgb29wcy4gSWxsZWdhbCByYW5nZXMgb2YgaW5jb21pbmcg
aW5kaWNlcyBhcmUgY2F1Z2h0IHRvby4KPiAgKi8KPiBzdGF0aWMgX19hbHdheXNfaW5saW5lIHVu
c2lnbmVkIGxvbmcgZml4X3RvX3ZpcnQoY29uc3QgdW5zaWduZWQgaW50IGlkeCkKPiB7Cj4gICAg
ICAgICBCVUlMRF9CVUdfT04oaWR4ID49IF9fZW5kX29mX2ZpeGVkX2FkZHJlc3Nlcyk7Cj4gICAg
ICAgICByZXR1cm4gX19maXhfdG9fdmlydChpZHgpOwo+IH0KPiAKPiAtLSAKPiBCZXN0IFJlZ2Fy
ZHMKPiAgR3VvIFJlbgo+IAo+IE1MOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1jc2t5
LwoKCi0tIApNYXNhbWkgSGlyYW1hdHN1IDxtaGlyYW1hdEBrZXJuZWwub3JnPgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGlu
ZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
