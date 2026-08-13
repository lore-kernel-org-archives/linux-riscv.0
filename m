Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B5EDC5CFDB
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Aug 2026 08:40:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Y6KWDi6gK7t+UXSEK1MGq7dwDIWOcC+qM19IE350vrs=; b=ULtIDfVPS+AWCl
	ESEnMr1nRLF+w7NiJicQEclsJLA/2yAaBGQXosqaoqjqsUVVc3EWnzuvpiUxRtgb+cloHYc0AhhcV
	p0Pc/0qp9rs4a5MMkhJjXN+RQWsSrKHibx+TtB/nYdNMYIlXaU3f60PWh9zjUjWXTzcDxfRYT6iom
	pHUhc/LObqlrFFlw1RK2xtUds7UOaQ6Dj9vY2jPuoGTVL3JJKBXzzzVItmWPYmtVYGy6EjmWCp1/c
	DfhPMBIbN8yxSvQdGsgJ3qkXn1saLQ1rcsV4GLk50Slh40O17+VVZY8CuGMyAdJk+P77YqQntaZF5
	3r6UrsD7lx7dbeXOI0KQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuQzW-00000000BVc-1AZ3;
	Thu, 13 Aug 2026 08:40:46 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuQzU-00000000BTz-0ETm
	for linux-riscv@lists.infradead.org;
	Thu, 13 Aug 2026 08:40:45 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-47f7872abb6so842022f8f.3
        for <linux-riscv@lists.infradead.org>; Thu, 13 Aug 2026 01:40:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786610442; cv=none;
        d=google.com; s=arc-20260327;
        b=gOTXNKzU3h+DUdz8NzZRzae27O8ekPvO4lrb99tB/fALojLJ1dGF3IfKr72uBeAKW2
         D2FMt6GsrkHzQRHzoxyEU+MkBUb1lEpYO4KfpBvlFWka0nqSrkvbnv/BnIAvQ+g+4RBN
         dFsDBMqwERPOWmp+syNptooFGpXFbb43KdA1LqPxMgSRtlc/7jkyZKfM7cYDdESZNq73
         yXhn8triFsT4aRZsU7U9uj81toM07xBDGuGC9+YZBrFSfHFO/4jJzs4hq0OxjVHPX0yC
         bs6YZ0zEdFrXtCJEoUY5pXHhRU4i0gnjvogK5wQTN7BvmDtQrFSqeEgUCN7guWZryGSQ
         Ln2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GAjwJRpfBD/JWXSbURgfEPPxVGoEkz0afDBoyYiML+0=;
        fh=dHIZb87Y3VmKGBa96EntnJSJ460siGu+/pQJRrASfvs=;
        b=N2YFsjR/sfKFd2zGqZi72YijBq4F6uHGATOspoP71jaIvstNmamn6KlLj7cAp3vw7s
         rWw7yB9cDTgZ+p4r96xpoHrTy+8YabRxiEU5DNe8CIU7htQ7STaCUbFdiRek7g+xr0wt
         t5ORMMFOauyx1XunvcGZBSg4Bs00St7jRzzHq18a00mjMzU0snCBWP1Ub1zmm43qb3fI
         Jxft1514/FoS0DiS38nQ0VWRogZy0tfHMOuGhaa+EJtcG35IhU1MxXwv2QmTBio8xStP
         LpnkSP27W0P+KpKBW8QhCe1zlWq4OmN65ecZY/UrmEZMahl5ZfOkwIidXo2fw/KDPZHa
         m3+Q==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1786610442; x=1787215242; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GAjwJRpfBD/JWXSbURgfEPPxVGoEkz0afDBoyYiML+0=;
        b=b7/oKp9HON9Gt08xQQHlAjHJdFE0AxYpaLoLEQci51nIdIOrwBRzVniHpCLNU6D8sU
         L8CRdCFxVsYB+zaqXiRG0KKWF0rxic1PFwP1whX23VbBltvVdR3ofpo3p5oSXesv+Hal
         jBXeQkresBMiKtbhOXDm+eQR0e6a40IdFHafnIEbjVKQAXnlcamG0xb/oezE9NnFjjZ+
         9sTAdx2yxVq/rJ2nXUlV8tPPDQjCcuTjg26LcT2JZI6861BxI4EfKkn2M6oStmmgafEs
         +o+vg5viU3/zjxQV+TQsDcuCOy+yPl9E52dsoqZxuhAwPp0mZndb5brFeNQ60fpjf4n5
         QBUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786610442; x=1787215242;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GAjwJRpfBD/JWXSbURgfEPPxVGoEkz0afDBoyYiML+0=;
        b=iDluvqTTKWGROnSJQAyNYUcAY2UJx1o4LJ8iS2W6k5AAkUkfQ2wGY+dP6MTu0jso3A
         diXkY9Vb4vUfuUNeJAISYLxi/7v26kbjzgJnVQ8gnxk92D3+0Y7WsLHE/sQBf+TsF/BI
         BLDorMfn1/H4RfyNwgOUmSABxIxxAGfEufyyPykW0pniVWFPw9pK8ah3MN5yNxEIGZlF
         W3QYMuqLptwgqLm5LeyaCgfa5ZP8pNJmMvmBapMGgnvTEsYeG4Pq0NWdoB33vmoD5dHO
         9f8kDvlL7VBSkoqo4nKfFl+qAh8lq1ky/s1KnqzGI5IWgqrFYFHfQ/Vou1RGMg+xcBDp
         j/OQ==
X-Forwarded-Encrypted: i=1; AHgh+RoVNxpeTDXlNcbjryaKVNZqEJ2yV8aaJNvws4gWbXT8nhKIGwRvaGHGHQNCzbSl0nb3pmUURqoCc5YzWg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzdqb0QTyyBfagCoclwoHezaXM0gNA9ErxmxSEmFtCW6U3H4nPR
	kkD91fMLWwnG5uFmRAvBT/0z4sPAS7q7d1jmNc6mB6MzVRtWlBjDS8qkRYRMcyZr3BbccuOzaMg
	8dRn/ZpVQSwEAyzmV0HSfVYtWT5T8k8RpMQP9yUMxNg==
X-Gm-Gg: AR+sD117GZdLB8yDEEEFmxlVMUkKRffio9mGiQkuZgbq18wMOBXjAkWfTkDyrqklajG
	zztLZM7+YFCyU5w60ep0d5bm11YJpMWYLOkEOzI6muRebGr+Z8jaPA42G5pfL26YRkTMWBVzRNF
	PQMDK5/A1rEazvssLe4r/ouqEZK/uxsnlxJ82jJd8exmEKojy3h1ivQFF3gEHkyxyaNJnAlSvRi
	pXk2MBqi/VS7KTx4PlrHf9rILI928w7qGksrLZo5nRfnGEjEW1EzgAZlmUjZwezltuApo98FIuH
	W8wLrR9ruRbYWYV7XYrPxwTNB39AX+S78klj4b+Dy8Hu9yZPJOFrpUqoip1mdCqp8NLaq5Isye+
	G6i8xVrEjzHc8ziYm1lOd56fKt4BzmyS04xeRShPWflc3Oud84LhS3azGvAK1YIk=
X-Received: by 2002:a05:6000:298d:10b0:481:568d:f119 with SMTP id
 ffacd0b85a97d-48159b1d3c1mr4296373f8f.0.1786610441563; Thu, 13 Aug 2026
 01:40:41 -0700 (PDT)
MIME-Version: 1.0
References: <20260803215250.824417-1-tchiu@tenstorrent.com>
In-Reply-To: <20260803215250.824417-1-tchiu@tenstorrent.com>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 13 Aug 2026 14:10:29 +0530
X-Gm-Features: AUfX_mz8ZfOyzvFVUEkdttrkOy-1Dj5UA2WXbVdxjBe8oZwDHLHhhyTqqIkoD7c
Message-ID: <CAAhSdy01c0qnkAwzGj6rE6owb3h+KPSEbpPCBpMWhXZg66D0dg@mail.gmail.com>
Subject: Re: [PATCH v5 0/3] RISC-V: KVM: fix vcpu vector context handling
To: Andy Chiu <tchiu@tenstorrent.com>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, linux-riscv@lists.infradead.org, 
	kvm-riscv@lists.infradead.org, dfustini@oss.tenstorrent.com, 
	greentime.hu@sifive.com, andybnac@gmail.com, linux-kernel@vger.kernel.org, 
	olof@lixom.net, Yong-Xuan Wang <yongxuan.wang@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260813_014044_118228_AF352A69 
X-CRM114-Status: GOOD (  26.69  )
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

T24gVHVlLCBBdWcgNCwgMjAyNiBhdCAzOjIz4oCvQU0gQW5keSBDaGl1IDx0Y2hpdUB0ZW5zdG9y
cmVudC5jb20+IHdyb3RlOgo+Cj4gVGhpcyBzZXJpZXMgZml4ZXMgYSB2dHlwZSBjb3JydXB0aW9u
IGVuY291bnRlcmVkIHdoZW4gcnVubmluZyBwZXJmICsKPiB2ZWN0b3Igd29ya2xvYWQgb24gS1ZN
Lgo+Cj4gVGhlIHJvb3QgY2F1c2Ugb2YgdGhlIGJ1ZyBpcyB0aGF0IHRoZSBrZXJuZWwtbW9kZSB2
ZWN0b3IgKEtNVikKPiBtaXNhdHRyaWJ1dGVzIHRoZSBndWVzdCdzIHZjcHUgY29udGV4dCBhcyB0
aGUgdXNlcidzIGNvbnRleHQuIFRvIHNvbHZlCj4gdGhpcywgd2UgbmVlZCB0byBjb3JyZWN0bHkg
c2F2ZSB0aGUgdmNwdSBjb250ZXh0IHdoZW4gdGhlIGtlcm5lbC1tb2RlCj4gdmVjdG9yIGlzIHNl
cnZpbmcgYSBndWVzdC4KPgo+IEhvd2V2ZXIsIGNhbGxpbmcgZGlyZWN0bHkgaW50byBLVk0gZnJv
bSBSSVNDLVYgZ2VuZXJpYyBhcmNoaXRlY3R1cmUgY29kZQo+IGNyZWF0ZXMgYSByZXZlcnNlIGRl
cGVuZGVuY3ksIHdoaWNoIGlzIHByb2JsZW1hdGljIHdoZW4gS1ZNIGlzIGJ1aWx0IGFzCj4gYSBt
b2R1bGUuIFRvIGFkZHJlc3MgdGhpcywgd2UgaW50cm9kdWNlIGFuIFJDVS1wcm90ZWN0ZWQgY2Fs
bGJhY2sgZm9yCj4gY29udGV4dCBmbHVzaGluZywgd2hpY2ggS1ZNIHJlZ2lzdGVycyBkdXJpbmcg
bW9kdWxlIGluaXQuCj4KPiBQYXRjaCAxIGlzIGEgcHJlcGFyYXRvcnkgY2xlYW51cCB0aGF0IHJl
ZmFjdG9ycwo+IHJpc2N2X3Zfc3RhcnRfa2VybmVsX2NvbnRleHQoKS4KPiBQYXRjaCAyIHByZXBh
cmVzIGdldC9wdXRfY3B1X3ZlY3Rvcl9jb250ZXh0KCkgZm9yIGdhdXJkaW5nIHRoZSB1c2Ugb2YK
PiB2ZWN0b3IgaW4ga3ZtX2FyY2hfdmNwdV9sb2FkL3B1dCgpCj4gUGF0Y2ggMyBpbXBsZW1lbnRz
IHRoZSBjYWxsYmFjayBtZWNoYW5pc20gYW5kIGZpeGVzIHRoZSBjb250ZXh0IGhhbmRsaW5nLgo+
Cj4gUmVhc29uIGZvciB0aGlzIHJlc3BpbjoKPgo+IHB1dF9jcHVfdmVjdG9yX2NvbnRleHQgbWF5
IGNhc3VlIGEgdm9sdXRhcnkgY3R4c3djaC4gSWYgd2UgcHJlbWF0dXJlbHkKPiBzZXQgUklTQ1Zf
UFJFRU1QVF9WLCB0aGUgY29udGV4dCByZXN0b3JlIHBhdGggd2lsbCByYXNpc2UgTkVFRF9SRVNU
T1JFCj4gZm9yIHRoaXMga2VybmVsIHRocmVhZC4gQXMgdGhlIHJlc3VsdCwgYW55IGlycSB0YWtl
biBkdXJpbmcgdGhlCj4gc3Vic2VxdWVuY2UgcHJlZW1wdF92IHdvdWxkIHRyaWdnZXIgYSByZXN0
b3JlIGZyb20gdGhlIGVtcHR5L3N0YWxlCj4gY29udGV4dCBtZW1vcnkgb24gdGhlIGlycSByZXR1
cm4gcGF0aCBpbiByaXNjdl92X2NvbnRleHRfbmVzdGluZ19lbmQoKQo+Cj4gVGhlIGZpeCBpcyBz
dW1tYXJpemVkIGFzIGJlbG93Ogo+IC0tLSBhL2FyY2gvcmlzY3Yva2VybmVsL2tlcm5lbF9tb2Rl
X3ZlY3Rvci5jCj4gKysrIGIvYXJjaC9yaXNjdi9rZXJuZWwva2VybmVsX21vZGVfdmVjdG9yLmMK
PiBAQCAtMTgxLDggKzE4MSw4IEBAIHN0YXRpYyBpbnQgcmlzY3Zfdl9zdGFydF9rZXJuZWxfY29u
dGV4dCh2b2lkKQo+ICAgICAgICAgLyogVHJhbnNmZXIgdGhlIG93bmVyc2hpcCBvZiBWIGZyb20g
dXNlciB0byBrZXJuZWwsIHRoZW4gc2F2ZSAqLwo+ICAgICAgICAgZ2V0X2NwdV92ZWN0b3JfY29u
dGV4dCgpOwo+ICAgICAgICAgX19yaXNjdl9mbHVzaF92ZWN0b3JfY29udGV4dCgpOwo+IC0gICAg
ICAgcmlzY3Zfdl9zdGFydChSSVNDVl9QUkVFTVBUX1YpOwo+ICAgICAgICAgcHV0X2NwdV92ZWN0
b3JfY29udGV4dCgpOwo+ICsgICAgICAgcmlzY3Zfdl9zdGFydChSSVNDVl9QUkVFTVBUX1YpOwo+
ICAgICAgICAgcmV0dXJuIDA7Cj4gIH0KPgo+IFdlIHdpbGwgc2VuZCBhIG9wdGltaXphdGlvbiBw
YXRjaCB0aGF0IHJlbW92ZXMgdGhlIGNvc3RseSByaXNjdl92X2lzX29uKCkKPiBmb3Igdm9sdW50
YXJ5IHN3aXRjaCBkZXRlY3Rpb24uIEEga3NlbGZ0ZXN0IHRoYXQgc3RyZXNzZXMgdGhlIHZlY3Rv
cml6ZWQKPiB1c2VyIGNvcHkgd2lsbCBhbHNvIGJlIGluY2x1ZGVkIGludG8gdGhhdCBzZXJpZXMu
Cj4KPiBQYXRjaCBzdW1tYXJ5Ogo+ICAtIHVuY2hhbmdlZCBwYXRjaDogMSwgMgo+ICAtIG5ldyBw
YXRjaDogbm9uZQo+ICAtIG1vZGlmaWVkIHBhdGNoOiAzCj4KPiBDaGFuZ2Vsb2cgdjU6Cj4gIC0g
YWRkIHRoZSByLWIgZnJvbSBZb25nLVh1YW4KPiAgLSBmaXggYSBndWVzdCBib290IGZhaWwgdGhh
dCBoaXRzIH4xLzEwMCBpbiBob3N0IGtlcm5lbC1tb2RlIHZlY3Rvcgo+ICAtIExpbmsgdG8gdjQ6
IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8yMDI2MDcyNTAwMTc0OS4yNTc5Mjc0LTEtdGNo
aXVAdGVuc3RvcnJlbnQuY29tLwo+Cj4gQ2hhbmdlbG9nIHY0Ogo+ICAtIEluY2x1ZGUgYSBoZWFk
ZXIgdG8gc29sdmUgYSBtaWQtc2VyaWVzIGJ1aWxkIGZhaWwgKHBhdGNod29yayBjaSkKPiAgLSBE
cm9wIHByZWVtcHRfdl9zdGFydGVkIHRlc3QgaW4gbWF5X3VzZV9zaW1kIChTYXNoaWtvKQo+ICAt
IExpbmsgdG8gdjM6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8yMDI2MDcyNDE2NTAwMS4y
MzE3Nzg4LTEtdGNoaXVAdGVuc3RvcnJlbnQuY29tLwo+Cj4gQ2hhbmdlbG9nIHYzOgo+ICAtIExp
bWl0IHRoZSBleHBvcnQgc2NvcGUgZm9yIHtnZXQscHV0fV9jcHVfdmVjdG9yX2NvbnRleHQoKQo+
ICAtIGNsZWFycyBSSVNDVl9WX1ZDUFVfTkVFRF9SRVNUT1JFIGZsYWcgaW4gaG9zdCByZXN0b3Jl
IHRvIHByZXZlbnQKPiAgICBsZWFraW5nCj4gIC0gY29uc29saWRhdGVzIGd1ZXN0IHZlY3RvciBy
ZXN0b3JlIGF0IHJldHVybmluZyB0byBndWVzdCB0byBwcmV2ZW50Cj4gICAgdW5uZWNlc3Nhcnkg
c2F2ZS9yZXN0b3JlIGJldHdlZW4gdGhlIHByZWVtcHRpYmxlIHdpbmRvdyBmcm9tCj4gICAgdmNw
dV9sb2FkIHRvIHZjcHVfZW50ZXJfZXhpdAo+ICAtIERvY3VtZW50IGZsYWdzIGFkZGVkIHRvIHJp
c2N2X3ZfZmxhZ3MKPiAgLSBMaW5rIHRvIHYyOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwv
MjAyNjA3MTUwNTE2MjkuMTE2OTY0NS0xLXRjaGl1QHRlbnN0b3JyZW50LmNvbS8KPgo+IENoYW5n
ZWxvZyB2MjoKPiAgLSBBZGRyZXNzIGlzc3VlcyBwb2ludGVkIG91dCBieSBzYXNoaWtvICgyLCAz
KQo+ICAtIExpbmsgdG8gdjE6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8yMDI2MDcxMTAx
NTgzNS43NjcyNTktMS10Y2hpdUB0ZW5zdG9ycmVudC5jb20vCj4KPgo+IEFuZHkgQ2hpdSAoMyk6
Cj4gICByaXNjdjogdmVjdG9yOiByZWZhY3RvciByaXNjdl92X3N0YXJ0X2tlcm5lbF9jb250ZXh0
Cj4gICByaXNjdjogdmVjdG9yOiBhbGxvdyBub24tcHJlZW1wdGlibGUga2VybmVsLW1vZGUgdmVj
dG9yIHdpdGggSVJRcyBvZmYKPiAgIFJJU0MtVjogS1ZNOiBmaXggdmNwdSB2ZWN0b3IgY29udGV4
dCBoYW5kbGluZyBmb3Iga2VybmVsLW1vZGUgdmVjdG9yCj4KPiAgYXJjaC9yaXNjdi9pbmNsdWRl
L2FzbS9rdm1fdmNwdV92ZWN0b3IuaCB8IDI0ICsrKysrKysKPiAgYXJjaC9yaXNjdi9pbmNsdWRl
L2FzbS9wcm9jZXNzb3IuaCAgICAgICB8ICA4ICsrKwo+ICBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNt
L3NpbWQuaCAgICAgICAgICAgIHwgMTYgKy0tLS0KPiAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS92
ZWN0b3IuaCAgICAgICAgICB8ICA1ICsrCj4gIGFyY2gvcmlzY3Yva2VybmVsL2tlcm5lbF9tb2Rl
X3ZlY3Rvci5jICAgfCA4OCArKysrKysrKysrKysrKysrKy0tLS0tLS0KPiAgYXJjaC9yaXNjdi9r
dm0vbWFpbi5jICAgICAgICAgICAgICAgICAgICB8ICA0ICsrCj4gIGFyY2gvcmlzY3Yva3ZtL3Zj
cHUuYyAgICAgICAgICAgICAgICAgICAgfCAxMiArKysrCj4gIGFyY2gvcmlzY3Yva3ZtL3ZjcHVf
dmVjdG9yLmMgICAgICAgICAgICAgfCAyMiArKysrKy0KPiAgOCBmaWxlcyBjaGFuZ2VkLCAxMzkg
aW5zZXJ0aW9ucygrKSwgNDAgZGVsZXRpb25zKC0pCj4KPiAtLQo+IDIuNDMuMAoKTEdUTS4gSSBk
aWQgbm90IHNlZSBhbnkgb2J2aW91cyBpc3N1ZSBvbiBRRU1VIHZpcnQgbWFjaGluZS4KClJldmll
d2VkLWJ5OiBBbnVwIFBhdGVsIDxhbnVwQGJyYWluZmF1bHQub3JnPgoKUXVldWVkIHRoaXMgcGF0
Y2ggZm9yIExpbnV4LTcuMwoKVGhhbmtzLApBbnVwCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlz
Y3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
