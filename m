Return-Path: <SRS0=abkI=NS=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32C18C0044C
	for <infradead-linux-riscv@archiver.kernel.org>; Wed,  7 Nov 2018 10:47:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D0AA120827
	for <infradead-linux-riscv@archiver.kernel.org>; Wed,  7 Nov 2018 10:47:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YbYsKjQr";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qcWCXRhN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D0AA120827
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WOMavHxnysz51TsbjBSE1ZvaFd8rFDSSSQ/qEg2e6qA=; b=YbYsKjQrzr1nbp
	arNp3JGob7fWEglkYxPviCSkCOrBGbFATLPMeumG6NL2DvBBPyhZl68ruTlFhfhbgaxP7PkqiOM0V
	Gp9cp+goL04uNdwHLTs9ipHG/rwv/Q0u2pCuo/x8j/ATZO80cgb5Hb2uMke2XJbgmmQKtl4NDtE5B
	ix0zSXPlB7OvQzLVlHK6BJBeCKB8+IN5JPKFtwLLvHmwx7M4SD5W7dEVRlV578wSxnWwM/yDDq1x/
	Lez+DlN1UhaQuWFHBsYEK6UCx+6F9gPAgai/4i49xqyHlGs8fhUqn3nz0g6q/XHwoC250GxZ5Y8id
	MwkSIpaG4I1qTvS35SQw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gKLMo-0005Kc-Ty; Wed, 07 Nov 2018 10:47:22 +0000
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gKLLl-0003qr-25
 for linux-riscv@lists.infradead.org; Wed, 07 Nov 2018 10:46:18 +0000
Received: by mail-ot1-x344.google.com with SMTP id n46so10107325otb.9
 for <linux-riscv@lists.infradead.org>; Wed, 07 Nov 2018 02:46:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=5d2sZmArluhobQqxaA/yYKQnmCmIhPyJnd73IUvKZvs=;
 b=qcWCXRhNFqra5eSKHEGVNR76q5Mk5vIjjPXZ8J2XvfNfq0TSMVqhabJNJGtfbTEIJt
 IWn7WHYXayi11Nq8N/UNFgX5TBdzemN3pYiNhSPn5ILYFnb6U9BagkLZMC9hWLEPvOzf
 prhxde3xSvytNcppJ4iOGREmKmPOoX1wU9G34ORrCV1F8mgsmhg5CwTCOtW4+jvRxZqq
 fmOuPGBz9nIBPkGDk/c5Y4IDQOS4B6jvNrwpqe/OQL1bA8WMtDa31K66ehfzSa4IzWMA
 OXIZue3b8IkxXRyfpvYPvtbswlVzujwk/I8zr5Gcv8aJnUph4RI44vadEkQlOxjBsLc3
 AfAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=5d2sZmArluhobQqxaA/yYKQnmCmIhPyJnd73IUvKZvs=;
 b=FZ0xTUtIzuRp63Eyjp9fBLI8oRjA8ak/xgLqD2LalKt6B/Rw6A1rjKpzB8Yr+Agl9W
 Mr8usxB6HAJzQcsucz3lbY68dUWf1lheWXeb/yZDampmQh106ADNOhqJB81tElezugLe
 WsHjF/wUXao5aaLmkj78S7plFg2VvcyYlXUqnLFURvUCGD9dnwwjsiaMLx4ZW4qoAf/V
 fIkrk8YU1kKTwimfEWHuPNpNpxn1FU81yS4+rLJedTnCraGqZtAQxn3XmAP4djLZ/1vy
 g32xjci4Qe+ezCg90By1hab1q7N0g2vK3b+ZL0S3CY7TMrJEyCkrzHYKoaIJjDmonPm/
 /5UA==
X-Gm-Message-State: AGRZ1gLZbELAt02co5b7TMI+91p65c+8g0isDa9Jn7fvbbA6Q9/SxLJ4
 RaaUvZq0PJAMrcYKgDmo5pIvVUGmn+8oopSRoxs=
X-Google-Smtp-Source: AJdET5c038ooSHvbDaMKGdwg7KTWkzu82ulEFj6Cxzqax0F3IAgtHQYDI8JaMoGi0jhxzCs6Kji0VL0DBu0pxwCSnqc=
X-Received: by 2002:a9d:6315:: with SMTP id q21mr782901otk.174.1541587565520; 
 Wed, 07 Nov 2018 02:46:05 -0800 (PST)
MIME-Version: 1.0
References: <20181029104854.17432-1-david.abdurachmanov@gmail.com>
 <CAHC9VhSaGo0BmX5AsTcnppiVz2Lz8BFkjRA0jg_uuPix3Ziiog@mail.gmail.com>
 <CAEn-LTqQgQkA1XyihEg0MpADLPQADf3Ej2noUp29UtbcEaf0RA@mail.gmail.com>
In-Reply-To: <CAEn-LTqQgQkA1XyihEg0MpADLPQADf3Ej2noUp29UtbcEaf0RA@mail.gmail.com>
From: David Abdurachmanov <david.abdurachmanov@gmail.com>
Date: Wed, 7 Nov 2018 11:45:53 +0100
Message-ID:
 <CAEn-LTqizbzTkbE3vvdxKsb-cHOWbRStOZaNfNo5sNuC5LhxMQ@mail.gmail.com>
Subject: Re: [PATCH 0/2] riscv: add audit support
To: Paul Moore <paul@paul-moore.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181107_024617_106794_A0E30205 
X-CRM114-Status: GOOD (  16.21  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@sifive.com>,
 linux-kernel@vger.kernel.org, aou@eecs.berkeley.edu, linux-audit@redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181107104553.gSbvG3NiOjkvz20IyOQSEpbiRu2u30gArud1Zhx6am8@z>

T24gVHVlLCBOb3YgNiwgMjAxOCBhdCAxMDoyNSBQTSBEYXZpZCBBYmR1cmFjaG1hbm92CjxkYXZp
ZC5hYmR1cmFjaG1hbm92QGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBPbiBUdWUsIE5vdiA2LCAyMDE4
IGF0IDk6MDYgUE0gUGF1bCBNb29yZSA8cGF1bEBwYXVsLW1vb3JlLmNvbT4gd3JvdGU6Cj4gPgo+
ID4gT24gTW9uLCBPY3QgMjksIDIwMTggYXQgNjo0OSBBTSBEYXZpZCBBYmR1cmFjaG1hbm92Cj4g
PiA8ZGF2aWQuYWJkdXJhY2htYW5vdkBnbWFpbC5jb20+IHdyb3RlOgo+ID4gPiBUaGlzIHBhdGNo
c2V0IGFkZHMgc3lzdGVtIGNhbGwgYXVkaXQgc3VwcG9ydCBvbiByaXNjdiAocmlzY3YzMiAmCj4g
PiA+IHJpc2N2NjQpLgo+ID4gPgo+ID4gPiBUaGUgcGFjaHNldCB3YXMgcHJlcGFyZWQgb24gdG9w
IG9mIHY0LjE5IHRhZy4KPiA+ID4KPiA+ID4gYXVkaXQtdXNlcnNwYWNlIGNoYW5nZXMgd2VyZSBz
dWJtaXR0ZWQuIFNlZToKPiA+ID4gaHR0cHM6Ly9naXRodWIuY29tL2xpbnV4LWF1ZGl0L2F1ZGl0
LXVzZXJzcGFjZS9wdWxsLzczCj4gPiA+Cj4gPiA+IFRlc3RlZCB0aGUgZm9sbG93aW5nIG1hbnVh
bGx5Ogo+ID4gPiAtIGF1ZGl0Y3RsIChjaGVja2VkIHNldmVyYWwgZGlmZmVyZW50IGV4YW1wbGUg
cnVsZXMgZnJvbSBpbnRlcm5ldCkKPiA+ID4gLSBhdWxhc3QKPiA+ID4gLSBhdWxhc3Rsb2cKPiA+
ID4gLSBhdXNlYXJjaAo+ID4gPiAtIGF1c3lzY2FsbAo+ID4gPiAtIGF1cmVwb3J0Cj4gPiA+IC0g
YXV0cmFjZSAoY29tcGFyZWQgc29tZSBzeXNjYWxscyB0byBzdHJhY2U6IG9yZGVyIGFuZCByZXR1
cm4KPiA+ID4gICB2YWx1ZS9pbnB1dCBhcmd1bWVudHMgc2VlbSB0byBiZSBjb3JyZWN0KQo+ID4g
PiAtIC9wcm9jL3NlbGYvbG9naW51aWQgKHJlcXVpcmVkIGJ5IERORiBbcGFja2FnZSBtYW5hZ2Vy
XSkKPiA+ID4KPiA+ID4gSSBsb29rZWQgaW50byBhdWRpdC10ZXN0c3VpdGUgYW5kIHdpdGggc29t
ZSBhZGp1c3RtZW50cyByZXN1bHRzIGFyZToKPiA+ID4KPiA+ID4gRmFpbGVkIDQvMTQgdGVzdCBw
cm9ncmFtcy4gMTkvODggc3VidGVzdHMgZmFpbGVkLgo+ID4KPiA+IEkgcmVhbGl6ZSB0aGF0IHRo
ZSB0ZXN0IHN1aXRlIGZhaWx1cmVzIGFyZSBsaWtlbHkgbm90IGR1ZSB0byB5b3VyCj4gPiBjb2Rl
LCBidXQgcmF0aGVyIHNob3J0Y29taW5ncyBpbiB0aGUgdGVzdCBzdWl0ZSBpdHNlbGYsIGJ1dCBJ
IHRoaW5rIGl0Cj4gPiBpcyBpbXBvcnRhbnQgdG8gcmVzb2x2ZSB0aGVzZSBwcm9ibGVtcyBiZWZv
cmUgd2UgY29tbWl0IHRoZSBrZXJuZWwKPiA+IGNoYW5nZXMuCgpJIGRpZCBzb21lIGV4dHJhIHdv
cmsgdGhpcyBldmVuaW5nICh3ZWxsLCBhZnRlciBtaWRuaWdodCkgYW5kIEkgYW0gcGFzc2luZwph
bGwgYml0cyBJIHdvdWxkIGV4cGVjdCB0byBwYXNzLgoKVGVzdCBTdW1tYXJ5IFJlcG9ydAotLS0t
LS0tLS0tLS0tLS0tLS0tCnN5c2NhbGxfc29ja2V0Y2FsbC90ZXN0IChXc3RhdDogMCBUZXN0czog
MyBGYWlsZWQ6IDMpCiAgRmFpbGVkIHRlc3RzOiAgMS0zCkZpbGVzPTE0LCBUZXN0cz04OCwgMTA3
IHdhbGxjbG9jayBzZWNzICggMS4wNyB1c3IgIDAuMzggc3lzICsgNTguNzcKY3VzciAxOS4zMiBj
c3lzID0gNzkuNTQgQ1BVKQpSZXN1bHQ6IEZBSUwKRmFpbGVkIDEvMTQgdGVzdCBwcm9ncmFtcy4g
My84OCBzdWJ0ZXN0cyBmYWlsZWQuCgpUaGUgb25seSBmYWlsaW5nIHRlc3Qgbm93IGlzIHN5c2Nh
bGxfc29ja2V0Y2FsbCwgd2hpY2ggaXMgbm90IHN1cHBvcnRlZCBvbgpyaXNjdiBhbmQgb3RoZXJz
LgoKRnJvbSBtYW4gcGFnZToKCk9uIGEgc29tZSBhcmNoaXRlY3R1cmVzLWZvciBleGFtcGxlLCB4
ODYtNjQgYW5kIEFSTeKAlHRoZXJlIGlzIG5vCiAgICAgICBzb2NrZXRjYWxsKCkgc3lzdGVtIGNh
bGw7IGluc3RlYWQgc29ja2V0KDIpLCBhY2NlcHQoMiksIGJpbmQoMiksIGFuZAogICAgICAgc28g
b24gcmVhbGx5IGFyZSBpbXBsZW1lbnRlZCBhcyBzZXBhcmF0ZSBzeXN0ZW0gY2FsbHMuCgpUaGVu
IEkgcmVkb25lIHN5c2NhbGxfc29ja2V0Y2FsbCB0ZXN0IHRvIGZpdCBuZXcgNjQtYml0IGFyY2hl
cy4gSXQgc3RpbGwKbW9zdGx5IGNoZWNrcyB0aGUgc2FtZSB0aGluZywgYnV0IHVzZXMgZGlmZmVy
ZW50IHN5c2NhbGwuIEluc3RlYWQgb2YKc29ja2V0Y2FsbChTWVNfQ09OTkVDVCwgLi4pIHdlIGNo
ZWNrIGZvciBjb25uZWN0KC4uKS4gVGhpcyB3aWxsIG5vdApnZW5lcmF0ZSBTT0NLRVRDQUxMIHJl
Y29yZCwgdGh1cyBpbnN0ZWFkIGNoZWNrIGZvciBTWVNDQUxMCnJlY29yZCB3aGVyZSBzeXNjYWxs
PWNvbm5lY3QuCgpBbGwgaXMgaGVyZTogaHR0cHM6Ly9naXRodWIuY29tL2RhdmlkbHQvYXVkaXQt
dGVzdHN1aXRlL2NvbW1pdHMvcmlzY3Y2NAoKV2l0aCB0aGF0OgoKUnVubmluZyBhcyAgIHVzZXIg
ICAgcm9vdAogICAgICAgIHdpdGggY29udGV4dCB1bmNvbmZpbmVkX3U6dW5jb25maW5lZF9yOnVu
Y29uZmluZWRfdDpzMC1zMDpjMC5jMTAyMwogICAgICAgIG9uICAgc3lzdGVtICBGZWRvcmEKCmV4
ZWNfZXhlY3ZlL3Rlc3QgLi4uLi4uLi4uIG9rCmV4ZWNfbmFtZS90ZXN0IC4uLi4uLi4uLi4uIG9r
CmZpbGVfY3JlYXRlL3Rlc3QgLi4uLi4uLi4uIG9rCmZpbGVfZGVsZXRlL3Rlc3QgLi4uLi4uLi4u
IG9rCmZpbGVfcmVuYW1lL3Rlc3QgLi4uLi4uLi4uIG9rCmZpbHRlcl9leGNsdWRlL3Rlc3QgLi4u
Li4uIG9rCmZpbHRlcl9zZXNzaW9uaWQvdGVzdCAuLi4uIG9rCmxvZ2luX3R0eS90ZXN0IC4uLi4u
Li4uLi4uIG9rCmxvc3RfcmVzZXQvdGVzdCAuLi4uLi4uLi4uIG9rCm5ldGZpbHRlcl9wa3QvdGVz
dCAuLi4uLi4uIG9rCnN5c2NhbGxzX2ZpbGUvdGVzdCAuLi4uLi4uIG9rCnN5c2NhbGxfbW9kdWxl
L3Rlc3QgLi4uLi4uIG9rCnN5c2NhbGxfc29ja2V0Y2FsbC90ZXN0IC4uIG9rCnVzZXJfbXNnL3Rl
c3QgLi4uLi4uLi4uLi4uIG9rCkFsbCB0ZXN0cyBzdWNjZXNzZnVsLgpGaWxlcz0xNCwgVGVzdHM9
ODgsIDEyMyB3YWxsY2xvY2sgc2VjcyAoIDEuMjYgdXNyICAwLjU5IHN5cyArIDcwLjg1CmN1c3Ig
MjIuNjAgY3N5cyA9IDk1LjMwIENQVSkKUmVzdWx0OiBQQVNTCgpTYW1lIGF1ZGl0IGtlcm5lbCBw
YXRjaCBhbmQgbGliYXVkaXQsIG5vdGhpbmcgY2hhbmdlZCBoZXJlLgoKSG9wZWZ1bGx5IHRoaXMg
YWxsb3dzIHRvIG1vdmUgZm9yd2FyZCBhcyBJIHdvdWxkIGxvdmUgdG8gaGF2ZQphdWRpdCAmIHNl
Y2NvbXAgaW4gdGhlIG5leHQga2VybmVsIHZlcnNpb24gKGFuZCB0aHVzIEZlZG9yYSkuCgpUaGFu
a3MsCmRhdmlkCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2
Cg==
