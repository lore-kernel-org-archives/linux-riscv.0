Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB17BC4332F
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Nov 2022 09:47:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DBpy4Qcwwbk1VImArp25GlPx3ZLq+clxvHwvWyuSLOU=; b=ZIk1h2flltUg6t
	Wa/glmtaW+uyeolSeVB8OPsFhdzZLX1l3XPW/Z//6Pv5pmWHOYJBEPo+czyCP6t3HkQAB9c+ny2d5
	X1RBeBY+q8HDCco2XUGiV5c8UnYhE97fEAa4quPy7wDO381NMIT2XS0dPKewIjSXGthICdDOAEpyA
	PUy9U3+/1GdPJZm13uZ8gIIwYsGBEkhHd12BQoCwy0rqNtZGOKspKB70VlyzwcHNC6siOCAtUYRFx
	jTNJP8zJWp4dX/DLVmp3FzD6Gyr6CSwcFvsFTeUu3SbgM42BFouvzqZPasBvm1La3milWIIN0TwqP
	1dA7/QY/dLff/zFwNgVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxPrl-007HJb-MG; Tue, 22 Nov 2022 09:46:57 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxPrh-007HBV-NE
	for linux-riscv@lists.infradead.org; Tue, 22 Nov 2022 09:46:55 +0000
Received: by mail-pj1-x1029.google.com with SMTP id t17so12119800pjo.3
        for <linux-riscv@lists.infradead.org>; Tue, 22 Nov 2022 01:46:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fb2a2qPkiNyV79EPxFgoQUH1bBZRJ4pPl8l2Hu7egWs=;
        b=qkbeDWaMEih+xSYda34uaUzUrXMbtjUx6DZiDrTlV3PKpZtjBHk3b7xM2iVwoRB4a+
         IrBsAc0gcc2G/JprUzBk1toHVkr5LQLp5qHmRn6wGF4LCqIhV/qMZL6UQ7yOFinI/VnS
         R/vVv3UK5jVy7/jZ2DZEtKTPGDbupucmn5N/6dI4mgAX9DtHKZNSfl7OT/15R5XkkQqu
         /vbEk9P4Zf0h2Ac3E/UDTlFpKjOdiirCZfIViNQTaRq6YAoLtHv4D5hcvhwxnrU43JbK
         nuPXwh+/fWsGu7R9/9M8smCG5JZqVk/E7dECDpzFvEr0De6usViiCOvv/idyUCMvxmzM
         O3Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fb2a2qPkiNyV79EPxFgoQUH1bBZRJ4pPl8l2Hu7egWs=;
        b=FNPb91sQNdorOQnNPop1hZwZZIduJV9fKNZ/i/UN+xRVyGobBQibx9WO7s58zPQB2T
         xwfGEj9kKoblIabk8opqOyXwBm7h82z/N0hv8F2vUcTJD96SxHVpZRWvPusQ4v/KaF10
         9i3hz4cXdHju0+jUw7jkTKFUVv4Jn7uxRcpSdjIOtWBt0k2kwBbIxQJH6QnV4F6Evt+f
         1lqWhPe1AjpRJP2AT2MDTsq3o9/S/rNhprMpyR1wipQbEM9XHm5inbFjMH8h3OxmlUaH
         TJSfUOgeIhtGdyDc9vn+6t/FtV/k6WCeM14a431PimTYmWUl99dyz4ZlWPQL3deY0wso
         RQSA==
X-Gm-Message-State: ANoB5pmPzZEYHyg5JVy1ucSL6LutC1eMvvfX8ST6UyyhO1B4iDJSFp2p
	Vyk+CYQuEKZYWnyfu3z0b5oWnQ5eKXgwGfJTUNU=
X-Google-Smtp-Source: AA0mqf7IOUg8BcWStSC1num5dHrWSE+I+Al0NduEjlhEQtr6fNKF9LF2IPsvZnwLi5cQQHMQjf+Ua0MktKrb0TlETIY=
X-Received: by 2002:a17:902:ca04:b0:17f:7f7e:70c7 with SMTP id
 w4-20020a170902ca0400b0017f7f7e70c7mr5070065pld.107.1669110411632; Tue, 22
 Nov 2022 01:46:51 -0800 (PST)
MIME-Version: 1.0
References: <20221122075440.1165172-1-suagrfillet@gmail.com> <Y3yO+ii+NEVPTYFo@wendy>
In-Reply-To: <Y3yO+ii+NEVPTYFo@wendy>
From: Song Shuai <suagrfillet@gmail.com>
Date: Tue, 22 Nov 2022 09:46:40 +0000
Message-ID: <CAAYs2=h7jQMAHyixusGneXSvHACaS+7YDxNE5pCfJotjHpOkxA@mail.gmail.com>
Subject: Re: [PATCH] riscv/ftrace: fix ftrace_modify_call bug
To: Conor Dooley <conor.dooley@microchip.com>, guoren@kernel.org
Cc: rostedt@goodmis.org, mhiramat@kernel.org, mark.rutland@arm.com, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221122_014653_803062_6F1D083B 
X-CRM114-Status: GOOD (  23.37  )
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

Q29ub3IgRG9vbGV5IDxjb25vci5kb29sZXlAbWljcm9jaGlwLmNvbT4g5LqOMjAyMuW5tDEx5pyI
MjLml6XlkajkuowgMDg6NTflhpnpgZPvvJoKPgo+IE9uIFR1ZSwgTm92IDIyLCAyMDIyIGF0IDAz
OjU0OjQwUE0gKzA4MDAsIFNvbmcgU2h1YWkgd3JvdGU6Cj4gPiBXaXRoIHRoaXMgY29tbWl0IChy
aXNjdjogZnRyYWNlOiBSZWR1Y2UgdGhlIGRldG91ciBjb2RlIHNpemUgdG8gaGFsZikKPgo+IEFG
QUlDVCB0aGUgYWJvdmUgcGF0Y2ggaGFzIG5vdCBiZWVuIGFwcGxpZWQgJiB0aGlzIHBhdGNoIGhl
cmUgc2hvdWxkIGJlCj4gZm9sZGVkIGludG8gdGhlIG9mZmVuZGluZyBwYXRjaD8KPiBJJ3ZlIG1h
cmtlZCB0aGlzIG9uZSBhcyAiTm90IEFwcGxpY2FibGUiIGluIHBhdGNod29yayBhcyBhIHJlc3Vs
dCwgYnV0Cj4gbGV0IG1lIGtub3cgaWYgdGhhdCBpcyBhbiBpbmNvcnJlY3QgYXNzdW1wdGlvbi4K
Pgo+IFRoYW5rcywKPiBDb25vci4KPgpIaSwgQ29ub3I6CgpTb3JyeSB0byBkaXN0dXJiIHlvdSB3
aXRoIHRoaXMgcGF0Y2ggd2l0aG91dCBhZ2FpbnN0IHRoZSBtZXJnZWQgY29tbWl0IGxpc3QsCgpU
aGlzIHBhdGNoIGFjdHVhbGx5IGlzIGNyZWF0ZWQgZm9yIGZpeGluZyAocmlzY3Y6IGZ0cmFjZTog
UmVkdWNlIHRoZQpkZXRvdXIgY29kZSBzaXplIHRvIGhhbGYpCndoaWNoIGhhcyBub3QgYmVlbiBt
ZXJnZWQgeWV0LgoKQXMgR3VvIHJlcGxpZWQsIGhlIHdpbGwgZm9sZCBpdCBpbiB0aGUgdGFyZ2V0
IHBhdGNoLiBZb3UgY2FuIGlnbm9yZQp0aGlzIG9uZS4gU29ycnkgYWdhaW4uCgpCVFcsIGZvciBk
aXNwZWxsaW5nIHlvdXIgY29uZnVzaW9uIGFib3V0IG15IGVtYWlsIG5hbWUuCkFjdHVhbGx5LCBp
dCB3YXMgbWlzc3BlbGxlZCB3aGVuIHJlZ2lzdGVyaW5nLCBidXQgSSBrZWVwIGl0IGZvciBkYWls
eSB1c2UuClNvIHlvdSBjYW4gc2VuZCBpdCB3aXRob3V0IGNvbmNlcm4uIDpQCgotLSBTb25nCgoK
U29ycnkgZm9yIGJvdGhlcmluZyB5b3Ugd2l0aCB0aGUKPiA+IHBhdGNoZWQsIGZ0cmFjZSBidWcg
b2NjdXJyZWQgV2hlbiBob3N0aW5nIGtwcm9iZSBhbmQgZnVuY3Rpb24gdHJhY2VyCj4gPiBhdCB0
aGUgc2FtZSBmdW5jdGlvbi4KPiA+Cj4gPiBPYnZpb3VzbHksIHRoZSB2YXJpYWJsZSBjYWxsZXIg
aW4gZnRyYWNlX21vZGlmeV9jYWxsIHdhcyBhc3NpZ25lZCBieQo+ID4gcmVjLT5pcCB3aXRoIDQg
b2Zmc2V0IGZhaWxpbmcgdGhlIGNvZGUgcmVwbGFjaW5nIGF0IGZ1bmN0aW9uIGVudHJ5Lgo+ID4g
QW5kIHRoZSBjYWxsZXIgc2hvdWxkIGJlIGFzc2lnbmVkIGJ5IHJlYy0+aXAgZGlyZWN0bHkgdG8g
aW5kaWNhdGUKPiA+IHRoZSBmdW5jdGlvbiBlbnRyeS4KPiA+Cj4gPiBUaGUgZm9sbG93aW5nIGlz
IHRoZSBmdHJhY2UgYnVnIGxvZy4KPiA+Cj4gPiBgYGAKPiA+IFsgIDQxOS42MzI4NTVdIDAwMDAw
MDAwZjg3NzY4MDM6IGV4cGVjdGVkIChmZmUwMDI5NyAxYTQyODJlNykgYnV0IGdvdCAoMWE4Mjgy
ZTcgZjAyMjcxNzkpCj4gPiBbICA0MTkuNjMzMzkwXSAtLS0tLS0tLS0tLS1bIGZ0cmFjZSBidWcg
XS0tLS0tLS0tLS0tLQo+ID4gWyAgNDE5LjYzMzU1M10gZnRyYWNlIGZhaWxlZCB0byBtb2RpZnkK
PiA+IFsgIDQxOS42MzM1NjldIFs8ZmZmZmZmZmY4MDIwOTFjYz5dIGtlcm5lbF9yZWFkKzB4MC8w
eDUyCj4gPiBbICA0MTkuNjMzODYzXSAgYWN0dWFsOiAgIDk3OjAyOmUwOmZmOmU3OjgyOjgyOjFh
Cj4gPiBbICA0MTkuNjM0MDg3XSBVcGRhdGluZyBmdHJhY2UgY2FsbCBzaXRlIHRvIGNhbGwgYSBk
aWZmZXJlbnQgZnRyYWNlIGZ1bmN0aW9uCj4gPiBbICA0MTkuNjM0Mjc5XSBmdHJhY2UgcmVjb3Jk
IGZsYWdzOiBlMDAwMDAwMgo+ID4gWyAgNDE5LjYzNDQ4N10gICgyKSBSCj4gPiBbICA0MTkuNjM0
NDg3XSAgZXhwZWN0ZWQgdHJhbXA6IGZmZmZmZmZmODAwMDkzY2MKPiA+IFsgIDQxOS42MzQ5MzVd
IC0tLS0tLS0tLS0tLVsgY3V0IGhlcmUgXS0tLS0tLS0tLS0tLQo+ID4gYGBgCj4gPgo+ID4gU2ln
bmVkLW9mZi1ieTogU29uZyBTaHVhaSA8c3VhZ3JmaWxsZXRAZ21haWwuY29tPgo+ID4gLS0tCj4g
PiAgYXJjaC9yaXNjdi9rZXJuZWwvZnRyYWNlLmMgfCAyICstCj4gPiAgMSBmaWxlIGNoYW5nZWQs
IDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4gPgo+ID4gZGlmZiAtLWdpdCBhL2FyY2gv
cmlzY3Yva2VybmVsL2Z0cmFjZS5jIGIvYXJjaC9yaXNjdi9rZXJuZWwvZnRyYWNlLmMKPiA+IGlu
ZGV4IDhjNzdmMjM2ZmM3MS4uNjFiMjRkNzY3ZTJlIDEwMDY0NAo+ID4gLS0tIGEvYXJjaC9yaXNj
di9rZXJuZWwvZnRyYWNlLmMKPiA+ICsrKyBiL2FyY2gvcmlzY3Yva2VybmVsL2Z0cmFjZS5jCj4g
PiBAQCAtMTMyLDcgKzEzMiw3IEBAIGludCBmdHJhY2VfbW9kaWZ5X2NhbGwoc3RydWN0IGR5bl9m
dHJhY2UgKnJlYywgdW5zaWduZWQgbG9uZyBvbGRfYWRkciwKPiA+ICAgICAgICAgICAgICAgICAg
ICAgIHVuc2lnbmVkIGxvbmcgYWRkcikKPiA+ICB7Cj4gPiAgICAgICB1bnNpZ25lZCBpbnQgY2Fs
bFsyXTsKPiA+IC0gICAgIHVuc2lnbmVkIGxvbmcgY2FsbGVyID0gcmVjLT5pcCArIDQ7Cj4gPiAr
ICAgICB1bnNpZ25lZCBsb25nIGNhbGxlciA9IHJlYy0+aXA7Cj4gPiAgICAgICBpbnQgcmV0Owo+
ID4KPiA+ICAgICAgIG1ha2VfY2FsbF90MChjYWxsZXIsIG9sZF9hZGRyLCBjYWxsKTsKPiA+IC0t
Cj4gPiAyLjIwLjEKPiA+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXJpc2N2Cg==
