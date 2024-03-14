Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E95EDC5475B
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Mar 2024 06:28:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=F7nKwgLPFIBI8QcGZV9HJqRwb5k3DiDdtHO5NZaGQtc=; b=L0NlUKbqFoySUF
	zIc43WQMEO4dKcgEiTOd9lDAGk14Oz4XSOsiARFaDrDGfKayjlA+ohFzYOvMf/ongf59K0bzQBzzS
	qLS8LgKppXT0zdyPmAXy7uHOqXdrFcknQdSPTHzs+GpUwZmsm6qZ2rcbdV+G0kT9t4yUaXl27iAOW
	lU2GaKHznl+P5tCzsIaiEhXwH610JkJXSlst+zChZ5uLp7oeL0LSPnAc35cQwo9FBsIzyrhGKkKos
	dMfr1hvq82XTioGAy3Lt8Nqg+szh+m3uwh568/1FOh8yvjx8ZqFs+QM8phvQKTBzJcPsr6dAU8HOp
	20yQYpm3grys92/nb5Sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkeZS-0000000DDlD-1dqq;
	Thu, 14 Mar 2024 06:28:06 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkeZM-0000000DDjJ-0cb1;
	Thu, 14 Mar 2024 06:28:03 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-a45bb2a9c20so52403966b.0;
        Wed, 13 Mar 2024 23:27:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710397676; x=1711002476; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Wy48BMq7k7tUA5PbAAKgjU/lgoVJFz6MN9TbVJQFsQM=;
        b=OK3CHH30kXrEqjFDVlfxVWQkFBFDUrcYM1ANNc+coYwZFx1znemqPRV7YJiHEOt3OM
         OOm0LvWiXKuK4/8eHXOVQDtPuWV2zTuXixOkCWysHeNG+PTnT50DH6sYJR8layX/tzMC
         BQqZdDl4ig5512s945pHXgnnhcD2VCJ5sUJppKTVJen13Lvj3Ycp5gfeiiLe9dA2BXtZ
         eOTHr9nedhxn6VSS9TA0/pxlXQKqlCX4HyhU8QOOxfJB54OW2KQ+V3E+ffdFSeKFtOiH
         P0c+XyBj0u9VI5ELUTWMQ44nP3LTHnanRGL448LKo4G4UkL86eVOhxhvJovovSIRu7ut
         pIUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710397676; x=1711002476;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Wy48BMq7k7tUA5PbAAKgjU/lgoVJFz6MN9TbVJQFsQM=;
        b=QOkHZfLGfJrzkbrsSQ20nq02BSI0IPE/TxQHM7LhvUN/FlSK0q45h3JsR3hnLWiaIP
         hwnnIT6zsOPWV0gYS9qANNGfR5f4QMhecL5i4DdNJpYketE/H+W22Vx6A8CL89iQO0m7
         Hd6cEnpDrDwBQ0Z8oqYBTqHcltre6SSdO3bJUClAuPqM1lT29bBCFUPKcB/ciG81MDOE
         Pz+rNaSgBKqsWNHBIobn5/UYjbMjQ+P5/j3Q3ohrl9pYNJR9XCmBBvNwdphg85HE6pSj
         rSeXVk6l3rIbd0wGzy+qZyTTZvQ5h4l7ckolglG5jQ9ukOuGCC+AFOqMkayHRDl3WQ5Y
         JYFA==
X-Forwarded-Encrypted: i=1; AJvYcCWaC2Q3mXmKPRyxxHXbSrApUSugKgTFpcn0bPSW3jYyPT6rJE/wfJTmgJU+K0uKYRySg9MXXPshDeS0pRU0RX2qMMtrhG5RLO8eMJM+Cnk8PwXaT6DHdORSO/4LXYoLW8lH/r/4e4akkM+ksYtH6iqAfcUKFRA=
X-Gm-Message-State: AOJu0YyLdOR/DtMPxOjdlbI6yDwlD+OBX6HSh0sohD/b9mabUJkzFhxf
	8twD2/yC3+JHEdK/RoItZjaMKq0NkJFfI1zx/OYSyqCZokPj1Teu
X-Google-Smtp-Source: AGHT+IF0pnR3t8OP32CidAqcEwLWVf5pxREHuVK53gI8rH7KwaQf04P9Mb0+ZaiK2iVNQgj+ScQKXQ==
X-Received: by 2002:a17:906:b899:b0:a3f:5ad2:1ff0 with SMTP id hb25-20020a170906b89900b00a3f5ad21ff0mr391041ejb.46.1710397675813;
        Wed, 13 Mar 2024 23:27:55 -0700 (PDT)
Received: from krava (2001-1ae9-1c2-4c00-726e-c10f-8833-ff22.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:726e:c10f:8833:ff22])
        by smtp.gmail.com with ESMTPSA id ld8-20020a170906f94800b00a46754900a4sm104587ejb.33.2024.03.13.23.27.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Mar 2024 23:27:55 -0700 (PDT)
From: Jiri Olsa <olsajiri@gmail.com>
X-Google-Original-From: Jiri Olsa <jolsa@kernel.org>
Date: Thu, 14 Mar 2024 07:27:52 +0100
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Cc: =?utf-8?B?5qKm6b6Z6JGj?= <dongmenglong.8@bytedance.com>,
	Andrii Nakryiko <andrii@kernel.org>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Martin KaFai Lau <martin.lau@linux.dev>, Eddy Z <eddyz87@gmail.com>,
	Song Liu <song@kernel.org>, Yonghong Song <yonghong.song@linux.dev>,
	John Fastabend <john.fastabend@gmail.com>,
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@google.com>,
	Hao Luo <haoluo@google.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	"David S. Miller" <davem@davemloft.net>,
	David Ahern <dsahern@kernel.org>,
	Dave Hansen <dave.hansen@linux.intel.com>, X86 ML <x86@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Quentin Monnet <quentin@isovalent.com>, bpf <bpf@vger.kernel.org>,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
	LKML <linux-kernel@vger.kernel.org>,
	linux-riscv <linux-riscv@lists.infradead.org>,
	linux-s390 <linux-s390@vger.kernel.org>,
	Network Development <netdev@vger.kernel.org>,
	linux-trace-kernel@vger.kernel.org,
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [External] Re: [PATCH bpf-next v2 1/9] bpf: tracing: add support
 to record and check the accessed args
Message-ID: <ZfKY6E8xhSgzYL1I@krava>
References: <20240311093526.1010158-1-dongmenglong.8@bytedance.com>
 <20240311093526.1010158-2-dongmenglong.8@bytedance.com>
 <CAADnVQKQPS5NcvEouH4JqZ2fKgQAC+LtcwhX9iXYoiEkF_M94Q@mail.gmail.com>
 <CALz3k9i5G5wWi+rtvHPwVLOUAXVMCiU_8QUZs87TEYgR_0wpPA@mail.gmail.com>
 <CAADnVQJ_ZCzMmT1aBsNXEBFfYNSVBdBXmLocjR0PPEWtYQrQFw@mail.gmail.com>
 <CALz3k9icPePb0c4FE67q=u1U0hrePorN9gDpQrKTR_sXbLMfDA@mail.gmail.com>
 <CAADnVQLwgw8bQ7OHBbqLhcPJ2QpxiGw3fkMFur+2cjZpM_78oA@mail.gmail.com>
 <CALz3k9g9k7fEwdTZVLhrmGoXp8CE47Q+83r-AZDXrzzuR+CjVA@mail.gmail.com>
 <CAADnVQLHpi3J6cBJ0QBgCQ2aY6fWGnVvNGdfi3W-jmoa9d1eVQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAADnVQLHpi3J6cBJ0QBgCQ2aY6fWGnVvNGdfi3W-jmoa9d1eVQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240313_232800_235249_9686818E 
X-CRM114-Status: GOOD (  42.36  )
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

T24gV2VkLCBNYXIgMTMsIDIwMjQgYXQgMDU6MjU6MzVQTSAtMDcwMCwgQWxleGVpIFN0YXJvdm9p
dG92IHdyb3RlOgo+IE9uIFR1ZSwgTWFyIDEyLCAyMDI0IGF0IDY6NTPigK9QTSDmoqbpvpnokaMg
PGRvbmdtZW5nbG9uZy44QGJ5dGVkYW5jZS5jb20+IHdyb3RlOgo+ID4KPiA+IE9uIFdlZCwgTWFy
IDEzLCAyMDI0IGF0IDEyOjQy4oCvQU0gQWxleGVpIFN0YXJvdm9pdG92Cj4gPiA8YWxleGVpLnN0
YXJvdm9pdG92QGdtYWlsLmNvbT4gd3JvdGU6Cj4gPiA+Cj4gPiA+IE9uIE1vbiwgTWFyIDExLCAy
MDI0IGF0IDc6NDLigK9QTSDmoqbpvpnokaMgPGRvbmdtZW5nbG9uZy44QGJ5dGVkYW5jZS5jb20+
IHdyb3RlOgo+ID4gPiA+Cj4gPiBbLi4uLi4uXQo+ID4gPgo+ID4gPiBJIHNlZS4KPiA+ID4gSSB0
aG91Z2h0IHlvdSdyZSBzaGFyaW5nIHRoZSB0cmFtcG9saW5lIGFjcm9zcyBhdHRhY2htZW50cy4K
PiA+ID4gKHNpbmNlIGJwZiBwcm9nIGlzIHRoZSBzYW1lKS4KPiA+Cj4gPiBUaGF0IHNlZW1zIHRv
IGJlIGEgZ29vZCBpZGVhLCB3aGljaCBJIGhhZG4ndCB0aG91Z2h0IGJlZm9yZS4KPiA+Cj4gPiA+
IEJ1dCBhYm92ZSBhcHByb2FjaCBjYW5ub3QgcG9zc2libHkgd29yayB3aXRoIGEgc2hhcmVkIHRy
YW1wb2xpbmUuCj4gPiA+IFlvdSBuZWVkIHRvIGNyZWF0ZSBpbmRpdmlkdWFsIHRyYW1wb2xpbmUg
Zm9yIGFsbCBhdHRhY2htZW50Cj4gPiA+IGFuZCBwb2ludCB0aGVtIHRvIHNpbmdsZSBicGYgcHJv
Zy4KPiA+ID4KPiA+ID4gdGJoIEknbSBsZXNzIGV4Y2l0ZWQgYWJvdXQgdGhpcyBmZWF0dXJlIG5v
dywgc2luY2Ugc2hhcmluZwo+ID4gPiB0aGUgcHJvZyBhY3Jvc3MgZGlmZmVyZW50IGF0dGFjaG1l
bnRzIGlzIG5pY2UsIGJ1dCBpdCB3b24ndCBzY2FsZQo+ID4gPiB0byB0aG91c2FuZHMgb2YgYXR0
YWNobWVudHMuCj4gPiA+IEkgYXNzdW1lZCB0aGF0IHRoZXJlIHdpbGwgYmUgYSBzaW5nbGUgdHJh
bXBvbGluZSB3aXRoIG1heChhcmdubykKPiA+ID4gYWNyb3NzIGF0dGFjaG1lbnRzIGFuZCBhdHRh
Y2gvZGV0YWNoIHdpbGwgc2NhbGUgdG8gdGhvdXNhbmRzLgo+ID4gPgo+ID4gPiBXaXRoIGluZGl2
aWR1YWwgdHJhbXBvbGluZSB0aGlzIHdpbGwgd29yayBmb3IgdXAgdG8gYSBodW5kcmVkCj4gPiA+
IGF0dGFjaG1lbnRzIG1heC4KPiA+Cj4gPiBXaGF0IGRvZXMgImEgaHVuZHJlZCBhdHRhY2htZW50
cyBtYXgiIG1lYW5zPyBDYW4ndCBJCj4gPiB0cmFjZSB0aG91c2FuZHMgb2Yga2VybmVsIGZ1bmN0
aW9ucyB3aXRoIGEgYnBmIHByb2dyYW0gb2YKPiA+IHRyYWNpbmcgbXVsdGktbGluaz8KPiAKPiBJ
IG1lYW4gd2hhdCB0aW1lIGRvZXMgaXQgdGFrZSB0byBhdHRhY2ggb25lIHByb2dyYW0KPiB0byAx
MDAgZmVudHJ5LXMgPwo+IFdoYXQgaXMgdGhlIHRpbWUgZm9yIDFrIGFuZCBmb3IgMTBrID8KPiAK
PiBUaGUga3Byb2JlIG11bHRpIHRlc3QgYXR0YWNoZXMgdG8gcHJldHR5IG11Y2ggYWxsIGZ1bmNz
IGluCj4gL3N5cy9rZXJuZWwvdHJhY2luZy9hdmFpbGFibGVfZmlsdGVyX2Z1bmN0aW9ucwo+IGFu
ZCBpdCdzIGZhc3QgZW5vdWdoIHRvIHJ1biBpbiB0ZXN0X3Byb2dzIG9uIGV2ZXJ5IGNvbW1pdCBp
biBicGYgQ0kuCj4gU2VlIGdldF9zeW1zKCkgaW4gcHJvZ190ZXN0cy9rcHJvYmVfbXVsdGlfdGVz
dC5jCj4gCj4gQ2FuIHRoaXMgbmV3IG11bHRpIGZlbnRyeSBkbyB0aGF0Pwo+IGFuZCBhdCB3aGF0
IHNwZWVkPwo+IFRoZSBhbnN3ZXIgd2lsbCBkZWNpZGUgaG93IGFwcGxpY2FibGUgdGhpcyBhcGkg
aXMgZ29pbmcgdG8gYmUuCj4gR2VuZXJhdGluZyBkaWZmZXJlbnQgdHJhbXBvbGluZXMgZm9yIGV2
ZXJ5IGF0dGFjaCBwb2ludAo+IGlzIGFuIGFwcHJvYWNoIGFzIHdlbGwuIFBscyBiZW5jaG1hcmsg
aXQgdG9vLgo+IAo+ID4gPgo+ID4gPiBMZXQncyBzdGVwIGJhY2suCj4gPiA+IFdoYXQgaXMgdGhl
IGV4YWN0IHVzZSBjYXNlIHlvdSdyZSB0cnlpbmcgdG8gc29sdmU/Cj4gPiA+IE5vdCBhbiBhcnRp
ZmljaWFsIG9uZSBhcyBzZWxmdGVzdCBpbiBwYXRjaCA5LCBidXQgdGhlIHJlYWwgdXNlIGNhc2U/
Cj4gPgo+ID4gSSBoYXZlIGEgdG9vbCwgd2hpY2ggaXMgdXNlZCB0byBkaWFnbm9zZSBuZXR3b3Jr
IHByb2JsZW1zLAo+ID4gYW5kIGl0cyBuYW1lIGlzICJuZXR0cmFjZSIuIEl0IHdpbGwgdHJhY2Ug
bWFueSBrZXJuZWwgZnVuY3Rpb25zLCB3aG9zZQo+ID4gZnVuY3Rpb24gYXJncyBjb250YWluICJz
a2IiLCBsaWtlIHRoaXM6Cj4gPgo+ID4gLi9uZXR0cmFjZSAtcCBpY21wCj4gPiBiZWdpbiB0cmFj
ZS4uLgo+ID4gKioqKioqKioqKioqKioqKiogZmZmZjg4OWJlOGZiZDUwMCxmZmZmODg5YmU4ZmJj
ZDAwICoqKioqKioqKioqKioqKgo+ID4gWzEyNzIzNDkuNjE0NTY0XSBbZGV2X2dyb19yZWNlaXZl
ICAgICBdIElDTVA6IDE2OS4yNTQuMTI4LjE1IC0+Cj4gPiAxNzIuMjcuMC42IHBpbmcgcmVxdWVz
dCwgc2VxOiA0ODIyMAo+ID4gWzEyNzIzNDkuNjE0NTc5XSBbX19uZXRpZl9yZWNlaXZlX3NrYl9j
b3JlXSBJQ01QOiAxNjkuMjU0LjEyOC4xNSAtPgo+ID4gMTcyLjI3LjAuNiBwaW5nIHJlcXVlc3Qs
IHNlcTogNDgyMjAKPiA+IFsxMjcyMzQ5LjYxNDU4NV0gW2lwX3JjdiAgICAgICAgICAgICAgXSBJ
Q01QOiAxNjkuMjU0LjEyOC4xNSAtPgo+ID4gMTcyLjI3LjAuNiBwaW5nIHJlcXVlc3QsIHNlcTog
NDgyMjAKPiA+IFsxMjcyMzQ5LjYxNDU5Ml0gW2lwX3Jjdl9jb3JlICAgICAgICAgXSBJQ01QOiAx
NjkuMjU0LjEyOC4xNSAtPgo+ID4gMTcyLjI3LjAuNiBwaW5nIHJlcXVlc3QsIHNlcTogNDgyMjAK
PiA+IFsxMjcyMzQ5LjYxNDU5OV0gW3NrYl9jbG9uZSAgICAgICAgICAgXSBJQ01QOiAxNjkuMjU0
LjEyOC4xNSAtPgo+ID4gMTcyLjI3LjAuNiBwaW5nIHJlcXVlc3QsIHNlcTogNDgyMjAKPiA+IFsx
MjcyMzQ5LjYxNDYxNl0gW25mX2hvb2tfc2xvdyAgICAgICAgXSBJQ01QOiAxNjkuMjU0LjEyOC4x
NSAtPgo+ID4gMTcyLjI3LjAuNiBwaW5nIHJlcXVlc3QsIHNlcTogNDgyMjAKPiA+IFsxMjcyMzQ5
LjYxNDYyOV0gW25mdF9kb19jaGFpbiAgICAgICAgXSBJQ01QOiAxNjkuMjU0LjEyOC4xNSAtPgo+
ID4gMTcyLjI3LjAuNiBwaW5nIHJlcXVlc3QsIHNlcTogNDgyMjAKPiA+IFsxMjcyMzQ5LjYxNDYz
NV0gW2lwX3Jjdl9maW5pc2ggICAgICAgXSBJQ01QOiAxNjkuMjU0LjEyOC4xNSAtPgo+ID4gMTcy
LjI3LjAuNiBwaW5nIHJlcXVlc3QsIHNlcTogNDgyMjAKPiA+IFsxMjcyMzQ5LjYxNDY0M10gW2lw
X3JvdXRlX2lucHV0X3Nsb3cgXSBJQ01QOiAxNjkuMjU0LjEyOC4xNSAtPgo+ID4gMTcyLjI3LjAu
NiBwaW5nIHJlcXVlc3QsIHNlcTogNDgyMjAKPiA+IFsxMjcyMzQ5LjYxNDY0N10gW2ZpYl92YWxp
ZGF0ZV9zb3VyY2UgXSBJQ01QOiAxNjkuMjU0LjEyOC4xNSAtPgo+ID4gMTcyLjI3LjAuNiBwaW5n
IHJlcXVlc3QsIHNlcTogNDgyMjAKPiA+IFsxMjcyMzQ5LjYxNDY1Ml0gW2lwX2xvY2FsX2RlbGl2
ZXIgICAgXSBJQ01QOiAxNjkuMjU0LjEyOC4xNSAtPgo+ID4gMTcyLjI3LjAuNiBwaW5nIHJlcXVl
c3QsIHNlcTogNDgyMjAKPiA+IFsxMjcyMzQ5LjYxNDY1OF0gW25mX2hvb2tfc2xvdyAgICAgICAg
XSBJQ01QOiAxNjkuMjU0LjEyOC4xNSAtPgo+ID4gMTcyLjI3LjAuNiBwaW5nIHJlcXVlc3QsIHNl
cTogNDgyMjAKPiA+IFsxMjcyMzQ5LjYxNDY2M10gW2lwX2xvY2FsX2RlbGl2ZXJfZmluaXNoXSBJ
Q01QOiAxNjkuMjU0LjEyOC4xNSAtPgo+ID4gMTcyLjI3LjAuNiBwaW5nIHJlcXVlc3QsIHNlcTog
NDgyMjAKPiA+IFsxMjcyMzQ5LjYxNDY2Nl0gW2ljbXBfcmN2ICAgICAgICAgICAgXSBJQ01QOiAx
NjkuMjU0LjEyOC4xNSAtPgo+ID4gMTcyLjI3LjAuNiBwaW5nIHJlcXVlc3QsIHNlcTogNDgyMjAK
PiA+IFsxMjcyMzQ5LjYxNDY3MV0gW2ljbXBfZWNobyAgICAgICAgICAgXSBJQ01QOiAxNjkuMjU0
LjEyOC4xNSAtPgo+ID4gMTcyLjI3LjAuNiBwaW5nIHJlcXVlc3QsIHNlcTogNDgyMjAKPiA+IFsx
MjcyMzQ5LjYxNDY3NV0gW2ljbXBfcmVwbHkgICAgICAgICAgXSBJQ01QOiAxNjkuMjU0LjEyOC4x
NSAtPgo+ID4gMTcyLjI3LjAuNiBwaW5nIHJlcXVlc3QsIHNlcTogNDgyMjAKPiA+IFsxMjcyMzQ5
LjYxNDcxNV0gW2NvbnN1bWVfc2tiICAgICAgICAgXSBJQ01QOiAxNjkuMjU0LjEyOC4xNSAtPgo+
ID4gMTcyLjI3LjAuNiBwaW5nIHJlcXVlc3QsIHNlcTogNDgyMjAKPiA+IFsxMjcyMzQ5LjYxNDcy
Ml0gW3BhY2tldF9yY3YgICAgICAgICAgXSBJQ01QOiAxNjkuMjU0LjEyOC4xNSAtPgo+ID4gMTcy
LjI3LjAuNiBwaW5nIHJlcXVlc3QsIHNlcTogNDgyMjAKPiA+IFsxMjcyMzQ5LjYxNDcyNV0gW2Nv
bnN1bWVfc2tiICAgICAgICAgXSBJQ01QOiAxNjkuMjU0LjEyOC4xNSAtPgo+ID4gMTcyLjI3LjAu
NiBwaW5nIHJlcXVlc3QsIHNlcTogNDgyMjAKPiA+Cj4gPiBGb3Igbm93LCBJIGhhdmUgdG8gY3Jl
YXRlIGEgYnBmIHByb2dyYW0gZm9yIGV2ZXJ5IGtlcm5lbAo+ID4gZnVuY3Rpb24gdGhhdCBJIHdh
bnQgdG8gdHJhY2UsIHdoaWNoIGlzIHVwIHRvIDIwMC4KPiA+Cj4gPiBXaXRoIHRoaXMgbXVsdGkt
bGluaywgSSBvbmx5IG5lZWQgdG8gY3JlYXRlIDUgYnBmIHByb2dyYW0sCj4gPiBsaWtlIHRoaXM6
Cj4gPgo+ID4gaW50IEJQRl9QUk9HKHRyYWNlX3NrYl8xLCBzdHJ1Y3QgKnNrYik7Cj4gPiBpbnQg
QlBGX1BST0codHJhY2Vfc2tiXzIsIHU2NCBhcmcwLCBzdHJ1Y3QgKnNrYik7Cj4gPiBpbnQgQlBG
X1BST0codHJhY2Vfc2tiXzMsIHU2NCBhcmcwLCB1NjQgYXJnMSwgc3RydWN0ICpza2IpOwo+ID4g
aW50IEJQRl9QUk9HKHRyYWNlX3NrYl80LCB1NjQgYXJnMCwgdTY0IGFyZzEsIHU2NCBhcmcyLCBz
dHJ1Y3QgKnNrYik7Cj4gPiBpbnQgQlBGX1BST0codHJhY2Vfc2tiXzUsIHU2NCBhcmcwLCB1NjQg
YXJnMSwgdTY0IGFyZzIsIHU2NCBhcmczLCBzdHJ1Y3QgKnNrYik7Cj4gPgo+ID4gVGhlbiwgSSBj
YW4gYXR0YWNoIHRyYWNlX3NrYl8xIHRvIGFsbCB0aGUga2VybmVsIGZ1bmN0aW9ucyB0aGF0Cj4g
PiBJIHdhbnQgdG8gdHJhY2UgYW5kIHdob3NlIGZpcnN0IGFyZyBpcyBza2I7IGF0dGFjaCB0cmFj
ZV9za2JfMiB0byBrZXJuZWwKPiA+IGZ1bmN0aW9ucyB3aG9zZSAybmQgYXJnIGlzIHNrYiwgZXRj
Lgo+ID4KPiA+IE9yLCBJIGNhbiBjcmVhdGUgb25seSBvbmUgYnBmIHByb2dyYW0gYW5kIHN0b3Jl
IHRoZSBpbmRleAo+ID4gb2Ygc2tiIHRvIHRoZSBhdHRhY2htZW50IGNvb2tpZSwgYW5kIGF0dGFj
aCB0aGlzIHByb2dyYW0gdG8gYWxsCj4gPiB0aGUga2VybmVsIGZ1bmN0aW9ucyB0aGF0IEkgd2Fu
dCB0byB0cmFjZS4KPiA+Cj4gPiBUaGlzIGlzIG15IHVzZSBjYXNlLiBXaXRoIHRoZSBtdWx0aS1s
aW5rLCBub3cgSSBvbmx5IGhhdmUKPiA+IDEgYnBmIHByb2dyYW0sIDEgYnBmIGxpbmssIDIwMCB0
cmFtcG9saW5lcywgaW5zdGVhZCBvZiAyMDAKPiA+IGJwZiBwcm9ncmFtcywgMjAwIGJwZiBsaW5r
IGFuZCAyMDAgdHJhbXBvbGluZXMuCj4gCj4gSSBzZWUuIFRoZSB1c2UgY2FzZSBtYWtlcyBzZW5z
ZSB0byBtZS4KPiBBbmRyaWkncyByZXRzbm9vcCBpcyB1c2VkIHRvIGRvIHNpbWlsYXIgdGhpbmcg
YmVmb3JlIGtwcm9iZSBtdWx0aSB3YXMKPiBpbnRyb2R1Y2VkLgo+IAo+ID4gVGhlIHNoYXJlZCB0
cmFtcG9saW5lIHlvdSBtZW50aW9uZWQgc2VlbXMgdG8gYmUgYQo+ID4gd29uZGVyZnVsIGlkZWEs
IHdoaWNoIGNhbiBtYWtlIHRoZSAyMDAgdHJhbXBvbGluZXMKPiA+IHRvIG9uZS4gTGV0IG1lIGhh
dmUgYSBsb29rLCB3ZSBjcmVhdGUgYSB0cmFtcG9saW5lIGFuZAo+ID4gcmVjb3JkIHRoZSBtYXgg
YXJncyBjb3VudCBvZiBhbGwgdGhlIHRhcmdldCBmdW5jdGlvbnMsIGxldCdzCj4gPiBtYXJrIGl0
IGFzIGFyZ19jb3VudC4KPiA+Cj4gPiBEdXJpbmcgZ2VuZXJhdGluZyB0aGUgdHJhbXBvbGluZSwg
d2UgYXNzdW1lIHRoYXQgdGhlCj4gPiBmdW5jdGlvbiBhcmdzIGNvdW50IGlzIGFyZ19jb3VudC4g
RHVyaW5nIGF0dGFjaGluZywgd2UKPiA+IGNoZWNrIHRoZSBjb25zaXN0ZW5jeSBvZiBhbGwgdGhl
IHRhcmdldCBmdW5jdGlvbnMsIGp1c3QgbGlrZQo+ID4gd2hhdCB3ZSBkbyBub3cuCj4gCj4gRm9y
IG9uZSB0cmFtcG9saW5lIHRvIGhhbmRsZSBhbGwgYXR0YWNoIHBvaW50cyB3ZSBtaWdodAo+IG5l
ZWQgc29tZSBhcmNoIHN1cHBvcnQsIGJ1dCB3ZSBjYW4gc3RhcnQgc2ltcGxlLgo+IE1ha2UgYnRm
X2Z1bmNfbW9kZWwgd2l0aCBNQVhfQlBGX0ZVTkNfUkVHX0FSR1MKPiBieSBjYWxsaW5nIGJ0Zl9k
aXN0aWxsX2Z1bmNfcHJvdG8oKSB3aXRoIGZ1bmM9PU5VTEwuCj4gQW5kIHVzZSB0aGF0IHRvIGJ1
aWxkIGEgdHJhbXBvbGluZS4KPiAKPiBUaGUgY2hhbGxlbmdlIGlzIGhvdyB0byB1c2UgbWluaW1h
bCBudW1iZXIgb2YgdHJhbXBvbGluZXMKPiB3aGVuIGJwZl9wcm9nQSBpcyBhdHRhY2hlZCBmb3Ig
ZnVuYzEsIGZ1bmMyLCBmdW5jMwo+IGFuZCBicGZfcHJvZ0IgaXMgYXR0YWNoZWQgdG8gZnVuYzMs
IGZ1bmM0LCBmdW5jNS4KPiBXZSdkIHN0aWxsIG5lZWQgMyB0cmFtcG9saW5lczoKPiBmb3IgZnVu
Y1sxMl0gdG8gY2FsbCBicGZfcHJvZ0EsCj4gZm9yIGZ1bmMzIHRvIGNhbGwgYnBmX3Byb2dBIGFu
ZCBicGZfcHJvZ0IsCj4gZm9yIGZ1bmNbNDVdIHRvIGNhbGwgYnBmX3Byb2dCLgo+IAo+IEppcmkg
d2FzIHRyeWluZyB0byBzb2x2ZSBpdCBpbiB0aGUgcGFzdC4gSGlzIHNsaWRlcyBmcm9tIExQQzoK
PiBodHRwczovL2xwYy5ldmVudHMvZXZlbnQvMTYvY29udHJpYnV0aW9ucy8xMzUwL2F0dGFjaG1l
bnRzLzEwMzMvMTk4My9wbHVtYmVycy5wZGYKPiAKPiBQbHMgc3R1ZHkgdGhlbSBhbmQgaGlzIHBy
aW9yIHBhdGNoc2V0cyB0byBhdm9pZCBzdGVwcGluZyBvbiB0aGUgc2FtZSByYWtlcy4KCnllcCwg
SSByZWZyYWluZWQgZnJvbSBjb21tZW50aW5nIG5vdCB0byB0YWtlIHlvdSBkb3duIHRoZSBzYW1l
IHBhdGgKSSBkaWQsIGJ1dCBpZiB5b3UgaW5zaXN0Li4gOy0pIAoKSSBtYW5hZ2VkIHRvIGZvcmdv
dCBhbG1vc3QgYWxsIG9mIGl0LCBidXQgdGhlIElJUkMgdGhlIG1haW4gcGFpbiBwb2ludAp3YXMg
dGhhdCBhdCBzb21lIHBvaW50IEkgaGFkIHRvIHNwbGl0IGV4aXN0aW5nIHRyYW1wb2xpbmUgd2hp
Y2ggY2F1c2VkCnRoZSB3aG9sZSB0cmFtcG9saW5lcyBtYW5hZ2VtZW50IGFuZCBlcnJvciBwYXRo
cyB0byBiZWNvbWUgYSBtZXNzCgpJIHRyaWVkIHRvIGV4cGxhaW4gdGhpbmdzIGluIFsxXSBjaGFu
Z2Vsb2cgYW5kIHRoZSBsYXRlc3QgcGF0Y2hzZXQgaXMgaW4gWzBdCgpmZWVsIGZyZWUgdG8gdXNl
L3Rha2UgYW55dGhpbmcsIGJ1dCBJIGFkdmljZSBzdHJvbmdseSBhZ2FpbnN0IGl0IDstKQpwbGVh
c2UgbGV0IG1lIGtub3cgaWYgSSBjYW4gaGVscAoKamlya2EKCgpbMF0gaHR0cHM6Ly9naXQua2Vy
bmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvam9sc2EvcGVyZi5naXQvbG9nLz9oPWJw
Zi9iYXRjaApbMV0gaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9n
aXQvam9sc2EvcGVyZi5naXQvY29tbWl0Lz9oPWJwZi9iYXRjaCZpZD01MmExZDRhY2RmNTVkZjQx
ZTk5Y2EyY2VhNTE4NjVlNjgyMTAzNmNlCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LXJpc2N2Cg==
