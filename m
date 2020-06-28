Return-Path: <SRS0=ohv9=AJ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99E34C433E0
	for <linux-riscv@archiver.kernel.org>; Sun, 28 Jun 2020 03:00:01 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 656D4208B6
	for <linux-riscv@archiver.kernel.org>; Sun, 28 Jun 2020 03:00:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="1Un9MuoO";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="hGHAMylK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 656D4208B6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:Message-Id:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ljCskGpoh+XyzISVHk6FXT3leHR4zewfjiDfxZ28Vs0=; b=1Un9MuoOYHHF/p80a/Pkf0ijL
	PouEiHQYDnytSOjBRrzAz3HHl4Z4oa6+YHCzo1GT/liptFJXzUPe9IcSnfYFLKJN2+IphUi0hCa0Y
	+nyV1hz2jNv8/R/MLSShOMrZyoQjt+O5h5eqvH2TArB6q0w4YeQb757MorE7ESMvBnUzJg0wXrA0x
	QXZtNGd7x0NMcId/053zlPWKoftVa2go8H9Y8N9r0uHd8SLhRfwsI8ctNSeBYwh/6njk4+fTnG3HG
	4sgJBjXMsfNUUnScBwP+IqEb8Yr1s/LnSa7kSgz8Dmr937nbECrqgPIMN3bTHWIfEXn9OHGT1Hyu5
	j9/BOK6IA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jpNXt-0003X9-EK; Sun, 28 Jun 2020 02:59:53 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jpNXr-0003X1-KK
 for linux-riscv@lists.infradead.org; Sun, 28 Jun 2020 02:59:52 +0000
Received: from devnote2 (NE2965lan1.rev.em-net.ne.jp [210.141.244.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C449A2080C;
 Sun, 28 Jun 2020 02:59:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1593313190;
 bh=sbQMZend8KSxiw8gOOfzjzEdTwk4tp9URNJS8mJYa+g=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=hGHAMylK7A0agHTX8RpBjZx86ofHLEMji07TlApTbh/WFsA0CNL6wtoBXChXIIvAO
 5as3zBX/O2vShnD3N7ZDJOjbbVFKkqPTqwpnQO3ZACRdSmudz0PPHcJMEAkUwNPuMg
 VeX0JJLsLQtmv6+lVXrzMYp+VIPp2Y0PLuAuq/Jc=
Date: Sun, 28 Jun 2020 11:59:45 +0900
From: Masami Hiramatsu <mhiramat@kernel.org>
To: guoren@kernel.org
Subject: Re: [PATCH] riscv: Fixup compile error BUILD_BUG_ON failed
Message-Id: <20200628115945.335b92c517cb8a8fa87be759@kernel.org>
In-Reply-To: <1593274802-46332-1-git-send-email-guoren@kernel.org>
References: <1593274802-46332-1-git-send-email-guoren@kernel.org>
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
Cc: Guo Ren <guoren@linux.alibaba.com>, anup@brainfault.org,
 palmerdabbelt@google.com, linux-kernel@vger.kernel.org,
 linux-csky@vger.kernel.org, Masami Hiramatsu <mhiramat@kernel.org>,
 zong.li@sifive.com, paul.walmsley@sifive.com, greentime.hu@sifive.com,
 linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gU2F0LCAyNyBKdW4gMjAyMCAxNjoyMDowMiArMDAwMApndW9yZW5Aa2VybmVsLm9yZyB3cm90
ZToKCj4gRnJvbTogR3VvIFJlbiA8Z3VvcmVuQGxpbnV4LmFsaWJhYmEuY29tPgo+IAo+IFVuZm9y
dHVuYXRlbHksIHRoZSBjdXJyZW50IGNvZGUgY291bGRuJ3QgYmUgY29tcGlsZWQsIGJlY2F1c2UK
PiBCVUlMRF9CVUdfT04gbmVlZHMgYSBzdGF0aWMgZGVmaW5lZCB2YWx1ZSwgbm90IGEgZHluYW1p
Ywo+IHZhcmlhYmxlIHdpdGggYTAgcmVncy4gSnVzdCB1c2UgaXQgaW5saW5lIGFzIGEgc29sdXRp
b24uCj4gCj4gICBDQyAgICAgIGFyY2gvcmlzY3Yva2VybmVsL3BhdGNoLm8KPiBJbiBmaWxlIGlu
Y2x1ZGVkIGZyb20gLi9pbmNsdWRlL2xpbnV4L2tlcm5lbC5oOjExLAo+ICAgICAgICAgICAgICAg
ICAgZnJvbSAuL2luY2x1ZGUvbGludXgvbGlzdC5oOjksCj4gICAgICAgICAgICAgICAgICBmcm9t
IC4vaW5jbHVkZS9saW51eC9wcmVlbXB0Lmg6MTEsCj4gICAgICAgICAgICAgICAgICBmcm9tIC4v
aW5jbHVkZS9saW51eC9zcGlubG9jay5oOjUxLAo+ICAgICAgICAgICAgICAgICAgZnJvbSBhcmNo
L3Jpc2N2L2tlcm5lbC9wYXRjaC5jOjY6Cj4gSW4gZnVuY3Rpb24g4oCYZml4X3RvX3ZpcnTigJks
Cj4gICAgIGlubGluZWQgZnJvbSDigJhwYXRjaF9tYXDigJkgYXQgYXJjaC9yaXNjdi9rZXJuZWwv
cGF0Y2guYzozNzoxNzoKPiAuL2luY2x1ZGUvbGludXgvY29tcGlsZXIuaDozOTI6Mzg6IGVycm9y
OiBjYWxsIHRvIOKAmF9fY29tcGlsZXRpbWVfYXNzZXJ0XzIwNeKAmSBkZWNsYXJlZCB3aXRoIGF0
dHJpYnV0ZSBlcnJvcjogQlVJTERfQlVHX09OIGZhaWxlZDogaWR4ID49IF9fZW5kX29mX2ZpeGVk
X2FkZHJlc3Nlcwo+ICAgX2NvbXBpbGV0aW1lX2Fzc2VydChjb25kaXRpb24sIG1zZywgX19jb21w
aWxldGltZV9hc3NlcnRfLCBfX0NPVU5URVJfXykKPiAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIF4KPiAuL2luY2x1ZGUvbGludXgvY29tcGlsZXIuaDozNzM6NDogbm90ZTog
aW4gZGVmaW5pdGlvbiBvZiBtYWNybyDigJhfX2NvbXBpbGV0aW1lX2Fzc2VydOKAmQo+ICAgICBw
cmVmaXggIyMgc3VmZml4KCk7ICAgIFwKPiAgICAgXn5+fn5+Cj4gLi9pbmNsdWRlL2xpbnV4L2Nv
bXBpbGVyLmg6MzkyOjI6IG5vdGU6IGluIGV4cGFuc2lvbiBvZiBtYWNybyDigJhfY29tcGlsZXRp
bWVfYXNzZXJ04oCZCj4gICBfY29tcGlsZXRpbWVfYXNzZXJ0KGNvbmRpdGlvbiwgbXNnLCBfX2Nv
bXBpbGV0aW1lX2Fzc2VydF8sIF9fQ09VTlRFUl9fKQo+ICAgXn5+fn5+fn5+fn5+fn5+fn5+fgo+
IC4vaW5jbHVkZS9saW51eC9idWlsZF9idWcuaDozOTozNzogbm90ZTogaW4gZXhwYW5zaW9uIG9m
IG1hY3JvIOKAmGNvbXBpbGV0aW1lX2Fzc2VydOKAmQo+ICAjZGVmaW5lIEJVSUxEX0JVR19PTl9N
U0coY29uZCwgbXNnKSBjb21waWxldGltZV9hc3NlcnQoIShjb25kKSwgbXNnKQo+ICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBefn5+fn5+fn5+fn5+fn5+fn4KPiAuL2luY2x1
ZGUvbGludXgvYnVpbGRfYnVnLmg6NTA6Mjogbm90ZTogaW4gZXhwYW5zaW9uIG9mIG1hY3JvIOKA
mEJVSUxEX0JVR19PTl9NU0figJkKPiAgIEJVSUxEX0JVR19PTl9NU0coY29uZGl0aW9uLCAiQlVJ
TERfQlVHX09OIGZhaWxlZDogIiAjY29uZGl0aW9uKQo+ICAgXn5+fn5+fn5+fn5+fn5+fgo+IC4v
aW5jbHVkZS9hc20tZ2VuZXJpYy9maXhtYXAuaDozMjoyOiBub3RlOiBpbiBleHBhbnNpb24gb2Yg
bWFjcm8g4oCYQlVJTERfQlVHX09O4oCZCj4gICBCVUlMRF9CVUdfT04oaWR4ID49IF9fZW5kX29m
X2ZpeGVkX2FkZHJlc3Nlcyk7Cj4gICBefn5+fn5+fn5+fn4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBH
dW8gUmVuIDxndW9yZW5AbGludXguYWxpYmFiYS5jb20+Cj4gQ2M6IE1hc2FtaSBIaXJhbWF0c3Ug
PG1oaXJhbWF0QGtlcm5lbC5vcmc+Cj4gQ2M6IFpvbmcgTGkgPHpvbmcubGlAc2lmaXZlLmNvbT4K
PiAtLS0KPiAgYXJjaC9yaXNjdi9rZXJuZWwvcGF0Y2guYyB8IDMgKy0tCj4gIDEgZmlsZSBjaGFu
Z2VkLCAxIGluc2VydGlvbigrKSwgMiBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvYXJj
aC9yaXNjdi9rZXJuZWwvcGF0Y2guYyBiL2FyY2gvcmlzY3Yva2VybmVsL3BhdGNoLmMKPiBpbmRl
eCBkNGE2NGRmLi5mOGU4NGYyIDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3Yva2VybmVsL3BhdGNo
LmMKPiArKysgYi9hcmNoL3Jpc2N2L2tlcm5lbC9wYXRjaC5jCj4gQEAgLTIwLDcgKzIwLDcgQEAg
c3RydWN0IHBhdGNoX2luc24gewo+ICB9Owo+ICAKPiAgI2lmZGVmIENPTkZJR19NTVUKPiAtc3Rh
dGljIHZvaWQgKnBhdGNoX21hcCh2b2lkICphZGRyLCBpbnQgZml4bWFwKQo+ICtzdGF0aWMgaW5s
aW5lIHZvaWQgKnBhdGNoX21hcCh2b2lkICphZGRyLCBpbnQgZml4bWFwKQoKV291bGQgd2UgYmUg
YmV0dGVyIHRvIHVzZSAiX19hbHdheXNfaW5saW5lIiBhcyBzYW1lIGFzIGZpeF90b192aXJ0PwpB
bmQgYWxzbywgY291bGQgeW91IGFkZCBhIGNvbW1lbnQgd2h5IHdlIG5lZWQgdG8gbWFrZSBpdCBp
bmxpbmU/CgpUaGFuayB5b3UsCgo+ICB7Cj4gIAl1aW50cHRyX3QgdWludGFkZHIgPSAodWludHB0
cl90KSBhZGRyOwo+ICAJc3RydWN0IHBhZ2UgKnBhZ2U7Cj4gQEAgLTM3LDcgKzM3LDYgQEAgc3Rh
dGljIHZvaWQgKnBhdGNoX21hcCh2b2lkICphZGRyLCBpbnQgZml4bWFwKQo+ICAJcmV0dXJuICh2
b2lkICopc2V0X2ZpeG1hcF9vZmZzZXQoZml4bWFwLCBwYWdlX3RvX3BoeXMocGFnZSkgKwo+ICAJ
CQkJCSAodWludGFkZHIgJiB+UEFHRV9NQVNLKSk7Cj4gIH0KPiAtTk9LUFJPQkVfU1lNQk9MKHBh
dGNoX21hcCk7Cj4gIAo+ICBzdGF0aWMgdm9pZCBwYXRjaF91bm1hcChpbnQgZml4bWFwKQo+ICB7
Cj4gLS0gCj4gMi43LjQKPiAKCgotLSAKTWFzYW1pIEhpcmFtYXRzdSA8bWhpcmFtYXRAa2VybmVs
Lm9yZz4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxp
bnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
