Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D74DCC54E5D
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Mar 2024 16:12:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dqq1gOS3VyaJkubSfhh4ilvqgGGEjiAhfy4wkY0fgvo=; b=mvWvu/1Sq8TH7U
	rTGTTm1yrDT5Oz4T9zYp5aOoe0H2Q//Qu2mBb0NE0wJ/PHF2M12CxeIJiYqVn0+LIDCQfN5sySJ8S
	kUDIy0ivfk6gaHBrPkfTmFPXlkgSwk2sK9AOWWkKPUcOiHfpKF5N0TYaE5nGgNbYXPwjCceiTU9EC
	ROUWB6N1naHKf31Guswgs+wiu0V5eXICEhUrkoEALpd5Qk9lcK36plC3Rx2rgvCR+i4sqvxiswc+7
	+xsJDLMEa+dWYasRVqeCAQgk15nJ0d2FdSox+RJyFFswKRB1gfVLo5L46k9erHtMahN2Ja4Bs8r0/
	Gwe3ZvQKSl/FRjeH6rsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rk4jY-00000006XRE-0gYz;
	Tue, 12 Mar 2024 16:12:08 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rk4jQ-00000006XLs-2IW7;
	Tue, 12 Mar 2024 16:12:03 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-33e99b639e0so1410164f8f.0;
        Tue, 12 Mar 2024 09:11:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710259913; x=1710864713; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mlMGohocih4/vv8NN3ExYyD4aDTNUoH7ERTwZOWg+9o=;
        b=mA43mY5uG5ogFUd7/iIFswXfv7i14tr1HViOuQofHKxllGqbgcMvGnzM8r/AWyxcxp
         PsxSmlkQfUkuw0Ux10N0b4QAPHcxBp0tWtf8PAXPyMd2NHxYyn5NsB/fVmrA7Ggl/OEv
         OoinmT2hC0Zf3V2RedC4we0dLbJhB5ZXHbfj6Kktnu1CrFSe8yfg6WdbWNnsdGqnOqvy
         TMXkgHhNKpCFPhVkZweX8tOqwiSsKR7AJu1CrqpLazRMP0UHmNeqk7D+qkZFiy1mz6Wm
         OPEHZsQmATof3zcI43hDJDQbx6/M8QoSFp/5CMxdONiWgiGHAK+T3K1+BipLiZT+cxR1
         7Cuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710259913; x=1710864713;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mlMGohocih4/vv8NN3ExYyD4aDTNUoH7ERTwZOWg+9o=;
        b=NNuR0ramQ5FK7EFAGeGYW4zbC5yyDOX3GHnheydoRXcohqAGln/ufOsmee6B7uXuIA
         B9jENqcpTNsozIQMvZ28SJIt+qyhgfQw5ufKrq8BPW75eXB1TP4Y5YYbTurXPWgN3uts
         jOIs2pFB/D3abBfIDylWy1g10PwA7UUeAOOUfTi47OapX65WwzD9qVW2vO2IOAXjNOy6
         YFCOOoeUrGli/q6HhdPDxG45EghHboVOB4+O1Jx7gPDfHExPCEi/ALG77UiC9lG7B4y/
         rogF11eZw6mkfKVIcqRBRN05JEXC1ZTpyMm0R3iYOTxybBqBTNMl9IX+b7m+Gg6mGkQm
         sSbA==
X-Forwarded-Encrypted: i=1; AJvYcCV8cy1LWvkU4YQ4w4CwC9chDLOJgzElwNDrTPaHK4iZbhH+3/wjbWW0ryGZ9BB1/Kgz5DGEgvypN/Rgu1eB4IAtmd71vbi1zASpzrKqrQRZL2OOtUki1BXod3UhPjbPpUqNlXOpM+cIwb9p17Fiiw4N04RqONg=
X-Gm-Message-State: AOJu0Ywr3vxwNznCf+nVEglG6yASsH7LAYHXF0LmdYo19TUtCGTky2BX
	LWFWQP/R1pXa3nPRICmBdI1oH5eeVrP06f2zEpx/XEWkH8oN3dzAxGyuhmEGC/+rR5AtLVfYu+3
	lybD5KGEvaDWlhWJfi+FWHnPc0Gw=
X-Google-Smtp-Source: AGHT+IEluJaPH2ZbEhOuqEk+ZR7WjEJU3XS86GzKec4PZE8B7+fsWbUJbxd+Mrhd/TndoYPK/al8v9EOlZQdZgQXq3Y=
X-Received: by 2002:adf:f60a:0:b0:33c:e396:b035 with SMTP id
 t10-20020adff60a000000b0033ce396b035mr458814wrp.69.1710259912730; Tue, 12 Mar
 2024 09:11:52 -0700 (PDT)
MIME-Version: 1.0
References: <20240311093526.1010158-1-dongmenglong.8@bytedance.com>
 <20240311093526.1010158-9-dongmenglong.8@bytedance.com> <CAADnVQK+s3XgSYhpSdh7_9Qhq4DimmSO-D9d5+EsSZQMX4TxxA@mail.gmail.com>
 <CALz3k9hZxsbUGoe5JoWpMEV0URykRwiKWLKZNj4nhvnXg3V=Zg@mail.gmail.com>
In-Reply-To: <CALz3k9hZxsbUGoe5JoWpMEV0URykRwiKWLKZNj4nhvnXg3V=Zg@mail.gmail.com>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Tue, 12 Mar 2024 09:11:41 -0700
Message-ID: <CAADnVQJ87Ov6ny2hj-0_WymGB3TeuEZu373EmqmRJqZv-8Ze_Q@mail.gmail.com>
Subject: Re: [External] Re: [PATCH bpf-next v2 8/9] libbpf: add support for
 the multi-link of tracing
To: =?UTF-8?B?5qKm6b6Z6JGj?= <dongmenglong.8@bytedance.com>
Cc: Andrii Nakryiko <andrii@kernel.org>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Martin KaFai Lau <martin.lau@linux.dev>, Eddy Z <eddyz87@gmail.com>, 
	Song Liu <song@kernel.org>, Yonghong Song <yonghong.song@linux.dev>, 
	John Fastabend <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>, 
	Stanislav Fomichev <sdf@google.com>, Hao Luo <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Sven Schnelle <svens@linux.ibm.com>, "David S. Miller" <davem@davemloft.net>, 
	David Ahern <dsahern@kernel.org>, Dave Hansen <dave.hansen@linux.intel.com>, 
	X86 ML <x86@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Quentin Monnet <quentin@isovalent.com>, 
	bpf <bpf@vger.kernel.org>, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, LKML <linux-kernel@vger.kernel.org>, 
	linux-riscv <linux-riscv@lists.infradead.org>, linux-s390 <linux-s390@vger.kernel.org>, 
	Network Development <netdev@vger.kernel.org>, linux-trace-kernel@vger.kernel.org, 
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>, linux-stm32@st-md-mailman.stormreply.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240312_091200_984677_36FABE39 
X-CRM114-Status: GOOD (  17.12  )
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

T24gTW9uLCBNYXIgMTEsIDIwMjQgYXQgNzo0NOKAr1BNIOaipum+meiRoyA8ZG9uZ21lbmdsb25n
LjhAYnl0ZWRhbmNlLmNvbT4gd3JvdGU6Cj4KPiBPbiBUdWUsIE1hciAxMiwgMjAyNCBhdCA5OjU2
4oCvQU0gQWxleGVpIFN0YXJvdm9pdG92Cj4gPGFsZXhlaS5zdGFyb3ZvaXRvdkBnbWFpbC5jb20+
IHdyb3RlOgo+ID4KPiA+IE9uIE1vbiwgTWFyIDExLCAyMDI0IGF0IDI6MzXigK9BTSBNZW5nbG9u
ZyBEb25nCj4gPiA8ZG9uZ21lbmdsb25nLjhAYnl0ZWRhbmNlLmNvbT4gd3JvdGU6Cj4gPiA+Cj4g
PiA+Cj4gPiA+IC0gICAgICAgICAgICAgICBlcnIgPSBsaWJicGZfZmluZF9hdHRhY2hfYnRmX2lk
KHByb2csIGF0dGFjaF9uYW1lLCAmYnRmX29ial9mZCwgJmJ0Zl90eXBlX2lkKTsKPiA+ID4gKyAg
ICAgICAgICAgICAgIG5hbWVfZW5kID0gc3RyY2hyKGF0dGFjaF9uYW1lLCAnLCcpOwo+ID4gPiAr
ICAgICAgICAgICAgICAgLyogZm9yIG11bHRpLWxpbmsgdHJhY2luZywgdXNlIHRoZSBmaXJzdCB0
YXJnZXQgc3ltYm9sIGR1cmluZwo+ID4gPiArICAgICAgICAgICAgICAgICogbG9hZGluZy4KPiA+
ID4gKyAgICAgICAgICAgICAgICAqLwo+ID4gPiArICAgICAgICAgICAgICAgaWYgKChkZWYgJiBT
RUNfQVRUQUNIX0JURl9NVUxUSSkgJiYgbmFtZV9lbmQpIHsKPiA+ID4gKyAgICAgICAgICAgICAg
ICAgICAgICAgaW50IGxlbiA9IG5hbWVfZW5kIC0gYXR0YWNoX25hbWUgKyAxOwo+ID4gPiArICAg
ICAgICAgICAgICAgICAgICAgICBjaGFyICpmaXJzdF90Z3Q7Cj4gPiA+ICsKPiA+ID4gKyAgICAg
ICAgICAgICAgICAgICAgICAgZmlyc3RfdGd0ID0gbWFsbG9jKGxlbik7Cj4gPiA+ICsgICAgICAg
ICAgICAgICAgICAgICAgIGlmICghZmlyc3RfdGd0KQo+ID4gPiArICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIHJldHVybiAtRU5PTUVNOwo+ID4gPiArICAgICAgICAgICAgICAgICAgICAg
ICBzdHJuY3B5KGZpcnN0X3RndCwgYXR0YWNoX25hbWUsIGxlbik7Cj4gPiA+ICsgICAgICAgICAg
ICAgICAgICAgICAgIGZpcnN0X3RndFtsZW4gLSAxXSA9ICdcMCc7Cj4gPiA+ICsgICAgICAgICAg
ICAgICAgICAgICAgIGVyciA9IGxpYmJwZl9maW5kX2F0dGFjaF9idGZfaWQocHJvZywgZmlyc3Rf
dGd0LCAmYnRmX29ial9mZCwKPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAmYnRmX3R5cGVfaWQpOwo+ID4gPiArICAgICAgICAgICAg
ICAgICAgICAgICBmcmVlKGZpcnN0X3RndCk7Cj4gPiA+ICsgICAgICAgICAgICAgICB9IGVsc2Ug
ewo+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICBlcnIgPSBsaWJicGZfZmluZF9hdHRhY2hf
YnRmX2lkKHByb2csIGF0dGFjaF9uYW1lLCAmYnRmX29ial9mZCwKPiA+ID4gKyAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAmYnRmX3R5cGVfaWQp
Owo+ID4gPiArICAgICAgICAgICAgICAgfQo+ID4KPiA+IFBscyB1c2UgZ2xvYl9tYXRjaCB0aGUg
d2F5IFtrdV1wcm9iZSBtdWx0aSBhcmUgZG9pbmcKPiA+IGluc3RlYWQgb2YgZXhhY3QgbWF0Y2gu
Cj4KPiBIZWxsbywKPgo+IEknbSBhIGxpdHRsZSBzdXNwZWN0aW5nIHRoZSBlZmZlY3Qgb2YgZ2xv
Yl9tYXRjaC4gSSBzZWxkb20gZm91bmQKPiB0aGUgdXNlIGNhc2UgdGhhdCB0aGUga2VybmVsIGZ1
bmN0aW9ucyB3aGljaCB3ZSB3YW50IHRvIHRyYWNlCj4gaGF2ZSB0aGUgc2FtZSBuYW1pbmcgcGF0
dGVybi4gQW5kIHRoZSBleGFjdCBtYXRjaCBzZWVtcyBtb3JlCj4gdXNlZnVsLgo+Cj4gQ2FuIHdl
IHVzZSBib3RoIGV4YWN0IGFuZCBnbG9iIG1hdGNoIGhlcmU/CgpleGFjdCBpcyBhIHN1YnNldCBv
ZiBnbG9iX21hdGNoLgpQbHMgZm9sbG93IHRoZSBwYXR0ZXJuIHRoYXRba3VdcHJvYmUgbXVsdGkg
ZXN0YWJsaXNoZWQKaW4gdGVybXMgb2YgdXNlciBpbnRlcmZhY2UgZXhwZWN0YXRpb25zLgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3Yg
bWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
