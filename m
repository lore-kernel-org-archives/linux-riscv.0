Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28EDBC54E58
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Mar 2024 01:54:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7T+JIFRnDlFBV63n04cEgnotBcuVUzo0ZCibdCdn+TQ=; b=AJsH0X49xoS5Z3
	l67IpLPGnnUBGp11AKzPU58JPEl4llLQE79e7/Y7nxVZc10OwBYHSfo4Z74tRy2QKyT5Fc02BTfKL
	YJKHQkKMqTktpDu4bRWgeRcoMpO0vbdBVj8BB3yqKEyr6a8fe5172/IRJ0YxERZ1kBN85r6WiSKYD
	I3qp1SFFDvfQUk28omo/JZegsRZNjpTkhdXFZniQ8Ic1YzUGMPdZVwTt52uU3h5cofzXFlsknvv4k
	Fan/ChnHsS/IGh1mTy3RcBKPvaSaDma6KQs5Mitwo9aPsMjyIVyJqcA/UgM/6tD236l80Ak2vnfVs
	rBUTUcfJfhqUOssRc1Aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkDog-00000008TuS-1uFx;
	Wed, 13 Mar 2024 01:54:02 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkDoZ-00000008Trq-2DZP
	for linux-riscv@lists.infradead.org;
	Wed, 13 Mar 2024 01:53:58 +0000
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-29be9c136a2so2418782a91.0
        for <linux-riscv@lists.infradead.org>; Tue, 12 Mar 2024 18:53:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1710294833; x=1710899633; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7l5GW7Xueu7fYsf7BEOcM5d+RaLSvHptG6HFvYvp5v8=;
        b=QWYQ0+7EH+DZkiQl9teqm5bX0HwAkFt2Njx5aIS+5NhcIjZiFLXkd+fNx7VUhPhTjg
         O+EaufTVNETc7ymnrT/eQO82hEf8NIXCfDUOUS9D9aBCQM/WHFcwqSetJB9G48G2gybe
         dDZDsoF9HTq2B2glfKq/3kIg1ipfoxngTzz3S/o8H/sVvVn7NnNlcDuzUD7YW/ZooX7V
         Lf62DhkrU8JlfZAHag1WMPDCTlKSdH/OjJ378dyPVWcd0xRLLZ7JC5r3jb62/POWBFiD
         tWVD1c4nphq06H/3kMPKM1x66718nc0XAVK5hMpG8M1AAuLJnwKM84st0fY+ElPgp59G
         FF8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710294833; x=1710899633;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7l5GW7Xueu7fYsf7BEOcM5d+RaLSvHptG6HFvYvp5v8=;
        b=RPTTJjuY1HEDdb6I7eTMhCWPGzqdVCkSlJ0KakuHtuANt3DVbsyW4Z4xAhTi3szxG2
         CY5LdRtuqK9TgY9ATuNtBAKK3xIlHJORM58GsvNUfjG5BKgvk7fcDn0fy34wo1DnCDmL
         mecSWGB+1fkLImrdC5mZVASp1Yl9t5+4A+ShajYRYMzoz9I/JmeuVP/KxQkLroSJkKej
         xovdWZHicmVmAiRb1Sr3ShzM3OzJT/iZFDtRiu49MIHE2yrIFxgPS4pO0IiB8q7mKrtA
         nnZziXr9cx5ADYf/CHg+s1JEPW646CqfxFV2vHw8X5G7qPXt255NqNQg1BFXeYtHp8Wn
         3lQg==
X-Forwarded-Encrypted: i=1; AJvYcCUKm5r8fij7DutD2AhYn0al22SkkVgUs/RyUJUvzdTiUQoLS9Y8PSuSl+orAom5SRsy5VwdxTppmyIlNgLFF3OlIBflLu5/5fGsSFo9JKCz
X-Gm-Message-State: AOJu0YyEjS5dnr3yukLgngztTSVURgdyeODdiMIBhvdFQjCdCRZjbolG
	+L+kBKi8mACTUd2woSIJbpBxV5DwpE8tHE6ol0SOgAbR+jx4Op9BF1bcrQEJKM2w6oSDxme6pJT
	WtBI+uXPp7NV6CaBzkzntDuCuXUr72JcESGuBaQ==
X-Google-Smtp-Source: AGHT+IHgGbwSxuf8Mmcf4YK9IOWtZvoBJarSb5lD1Bv4wCl1IDU6oxYJMO4FXlVIEhW8DTCD21/mcpij4jSoKbejNKI=
X-Received: by 2002:a17:90a:e612:b0:29c:1271:219e with SMTP id
 j18-20020a17090ae61200b0029c1271219emr6694584pjy.18.1710294833648; Tue, 12
 Mar 2024 18:53:53 -0700 (PDT)
MIME-Version: 1.0
References: <20240311093526.1010158-1-dongmenglong.8@bytedance.com>
 <20240311093526.1010158-2-dongmenglong.8@bytedance.com> <CAADnVQKQPS5NcvEouH4JqZ2fKgQAC+LtcwhX9iXYoiEkF_M94Q@mail.gmail.com>
 <CALz3k9i5G5wWi+rtvHPwVLOUAXVMCiU_8QUZs87TEYgR_0wpPA@mail.gmail.com>
 <CAADnVQJ_ZCzMmT1aBsNXEBFfYNSVBdBXmLocjR0PPEWtYQrQFw@mail.gmail.com>
 <CALz3k9icPePb0c4FE67q=u1U0hrePorN9gDpQrKTR_sXbLMfDA@mail.gmail.com> <CAADnVQLwgw8bQ7OHBbqLhcPJ2QpxiGw3fkMFur+2cjZpM_78oA@mail.gmail.com>
In-Reply-To: <CAADnVQLwgw8bQ7OHBbqLhcPJ2QpxiGw3fkMFur+2cjZpM_78oA@mail.gmail.com>
From: =?UTF-8?B?5qKm6b6Z6JGj?= <dongmenglong.8@bytedance.com>
Date: Wed, 13 Mar 2024 09:53:42 +0800
Message-ID: <CALz3k9g9k7fEwdTZVLhrmGoXp8CE47Q+83r-AZDXrzzuR+CjVA@mail.gmail.com>
Subject: Re: [External] Re: [PATCH bpf-next v2 1/9] bpf: tracing: add support
 to record and check the accessed args
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>
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
X-CRM114-CacheID: sfid-20240312_185355_598204_3F77616A 
X-CRM114-Status: GOOD (  18.36  )
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

T24gV2VkLCBNYXIgMTMsIDIwMjQgYXQgMTI6NDLigK9BTSBBbGV4ZWkgU3Rhcm92b2l0b3YKPGFs
ZXhlaS5zdGFyb3ZvaXRvdkBnbWFpbC5jb20+IHdyb3RlOgo+Cj4gT24gTW9uLCBNYXIgMTEsIDIw
MjQgYXQgNzo0MuKAr1BNIOaipum+meiRoyA8ZG9uZ21lbmdsb25nLjhAYnl0ZWRhbmNlLmNvbT4g
d3JvdGU6Cj4gPgpbLi4uLi4uXQo+Cj4gSSBzZWUuCj4gSSB0aG91Z2h0IHlvdSdyZSBzaGFyaW5n
IHRoZSB0cmFtcG9saW5lIGFjcm9zcyBhdHRhY2htZW50cy4KPiAoc2luY2UgYnBmIHByb2cgaXMg
dGhlIHNhbWUpLgoKVGhhdCBzZWVtcyB0byBiZSBhIGdvb2QgaWRlYSwgd2hpY2ggSSBoYWRuJ3Qg
dGhvdWdodCBiZWZvcmUuCgo+IEJ1dCBhYm92ZSBhcHByb2FjaCBjYW5ub3QgcG9zc2libHkgd29y
ayB3aXRoIGEgc2hhcmVkIHRyYW1wb2xpbmUuCj4gWW91IG5lZWQgdG8gY3JlYXRlIGluZGl2aWR1
YWwgdHJhbXBvbGluZSBmb3IgYWxsIGF0dGFjaG1lbnQKPiBhbmQgcG9pbnQgdGhlbSB0byBzaW5n
bGUgYnBmIHByb2cuCj4KPiB0YmggSSdtIGxlc3MgZXhjaXRlZCBhYm91dCB0aGlzIGZlYXR1cmUg
bm93LCBzaW5jZSBzaGFyaW5nCj4gdGhlIHByb2cgYWNyb3NzIGRpZmZlcmVudCBhdHRhY2htZW50
cyBpcyBuaWNlLCBidXQgaXQgd29uJ3Qgc2NhbGUKPiB0byB0aG91c2FuZHMgb2YgYXR0YWNobWVu
dHMuCj4gSSBhc3N1bWVkIHRoYXQgdGhlcmUgd2lsbCBiZSBhIHNpbmdsZSB0cmFtcG9saW5lIHdp
dGggbWF4KGFyZ25vKQo+IGFjcm9zcyBhdHRhY2htZW50cyBhbmQgYXR0YWNoL2RldGFjaCB3aWxs
IHNjYWxlIHRvIHRob3VzYW5kcy4KPgo+IFdpdGggaW5kaXZpZHVhbCB0cmFtcG9saW5lIHRoaXMg
d2lsbCB3b3JrIGZvciB1cCB0byBhIGh1bmRyZWQKPiBhdHRhY2htZW50cyBtYXguCgpXaGF0IGRv
ZXMgImEgaHVuZHJlZCBhdHRhY2htZW50cyBtYXgiIG1lYW5zPyBDYW4ndCBJCnRyYWNlIHRob3Vz
YW5kcyBvZiBrZXJuZWwgZnVuY3Rpb25zIHdpdGggYSBicGYgcHJvZ3JhbSBvZgp0cmFjaW5nIG11
bHRpLWxpbms/Cgo+Cj4gTGV0J3Mgc3RlcCBiYWNrLgo+IFdoYXQgaXMgdGhlIGV4YWN0IHVzZSBj
YXNlIHlvdSdyZSB0cnlpbmcgdG8gc29sdmU/Cj4gTm90IGFuIGFydGlmaWNpYWwgb25lIGFzIHNl
bGZ0ZXN0IGluIHBhdGNoIDksIGJ1dCB0aGUgcmVhbCB1c2UgY2FzZT8KCkkgaGF2ZSBhIHRvb2ws
IHdoaWNoIGlzIHVzZWQgdG8gZGlhZ25vc2UgbmV0d29yayBwcm9ibGVtcywKYW5kIGl0cyBuYW1l
IGlzICJuZXR0cmFjZSIuIEl0IHdpbGwgdHJhY2UgbWFueSBrZXJuZWwgZnVuY3Rpb25zLCB3aG9z
ZQpmdW5jdGlvbiBhcmdzIGNvbnRhaW4gInNrYiIsIGxpa2UgdGhpczoKCi4vbmV0dHJhY2UgLXAg
aWNtcApiZWdpbiB0cmFjZS4uLgoqKioqKioqKioqKioqKioqKiBmZmZmODg5YmU4ZmJkNTAwLGZm
ZmY4ODliZThmYmNkMDAgKioqKioqKioqKioqKioqClsxMjcyMzQ5LjYxNDU2NF0gW2Rldl9ncm9f
cmVjZWl2ZSAgICAgXSBJQ01QOiAxNjkuMjU0LjEyOC4xNSAtPgoxNzIuMjcuMC42IHBpbmcgcmVx
dWVzdCwgc2VxOiA0ODIyMApbMTI3MjM0OS42MTQ1NzldIFtfX25ldGlmX3JlY2VpdmVfc2tiX2Nv
cmVdIElDTVA6IDE2OS4yNTQuMTI4LjE1IC0+CjE3Mi4yNy4wLjYgcGluZyByZXF1ZXN0LCBzZXE6
IDQ4MjIwClsxMjcyMzQ5LjYxNDU4NV0gW2lwX3JjdiAgICAgICAgICAgICAgXSBJQ01QOiAxNjku
MjU0LjEyOC4xNSAtPgoxNzIuMjcuMC42IHBpbmcgcmVxdWVzdCwgc2VxOiA0ODIyMApbMTI3MjM0
OS42MTQ1OTJdIFtpcF9yY3ZfY29yZSAgICAgICAgIF0gSUNNUDogMTY5LjI1NC4xMjguMTUgLT4K
MTcyLjI3LjAuNiBwaW5nIHJlcXVlc3QsIHNlcTogNDgyMjAKWzEyNzIzNDkuNjE0NTk5XSBbc2ti
X2Nsb25lICAgICAgICAgICBdIElDTVA6IDE2OS4yNTQuMTI4LjE1IC0+CjE3Mi4yNy4wLjYgcGlu
ZyByZXF1ZXN0LCBzZXE6IDQ4MjIwClsxMjcyMzQ5LjYxNDYxNl0gW25mX2hvb2tfc2xvdyAgICAg
ICAgXSBJQ01QOiAxNjkuMjU0LjEyOC4xNSAtPgoxNzIuMjcuMC42IHBpbmcgcmVxdWVzdCwgc2Vx
OiA0ODIyMApbMTI3MjM0OS42MTQ2MjldIFtuZnRfZG9fY2hhaW4gICAgICAgIF0gSUNNUDogMTY5
LjI1NC4xMjguMTUgLT4KMTcyLjI3LjAuNiBwaW5nIHJlcXVlc3QsIHNlcTogNDgyMjAKWzEyNzIz
NDkuNjE0NjM1XSBbaXBfcmN2X2ZpbmlzaCAgICAgICBdIElDTVA6IDE2OS4yNTQuMTI4LjE1IC0+
CjE3Mi4yNy4wLjYgcGluZyByZXF1ZXN0LCBzZXE6IDQ4MjIwClsxMjcyMzQ5LjYxNDY0M10gW2lw
X3JvdXRlX2lucHV0X3Nsb3cgXSBJQ01QOiAxNjkuMjU0LjEyOC4xNSAtPgoxNzIuMjcuMC42IHBp
bmcgcmVxdWVzdCwgc2VxOiA0ODIyMApbMTI3MjM0OS42MTQ2NDddIFtmaWJfdmFsaWRhdGVfc291
cmNlIF0gSUNNUDogMTY5LjI1NC4xMjguMTUgLT4KMTcyLjI3LjAuNiBwaW5nIHJlcXVlc3QsIHNl
cTogNDgyMjAKWzEyNzIzNDkuNjE0NjUyXSBbaXBfbG9jYWxfZGVsaXZlciAgICBdIElDTVA6IDE2
OS4yNTQuMTI4LjE1IC0+CjE3Mi4yNy4wLjYgcGluZyByZXF1ZXN0LCBzZXE6IDQ4MjIwClsxMjcy
MzQ5LjYxNDY1OF0gW25mX2hvb2tfc2xvdyAgICAgICAgXSBJQ01QOiAxNjkuMjU0LjEyOC4xNSAt
PgoxNzIuMjcuMC42IHBpbmcgcmVxdWVzdCwgc2VxOiA0ODIyMApbMTI3MjM0OS42MTQ2NjNdIFtp
cF9sb2NhbF9kZWxpdmVyX2ZpbmlzaF0gSUNNUDogMTY5LjI1NC4xMjguMTUgLT4KMTcyLjI3LjAu
NiBwaW5nIHJlcXVlc3QsIHNlcTogNDgyMjAKWzEyNzIzNDkuNjE0NjY2XSBbaWNtcF9yY3YgICAg
ICAgICAgICBdIElDTVA6IDE2OS4yNTQuMTI4LjE1IC0+CjE3Mi4yNy4wLjYgcGluZyByZXF1ZXN0
LCBzZXE6IDQ4MjIwClsxMjcyMzQ5LjYxNDY3MV0gW2ljbXBfZWNobyAgICAgICAgICAgXSBJQ01Q
OiAxNjkuMjU0LjEyOC4xNSAtPgoxNzIuMjcuMC42IHBpbmcgcmVxdWVzdCwgc2VxOiA0ODIyMApb
MTI3MjM0OS42MTQ2NzVdIFtpY21wX3JlcGx5ICAgICAgICAgIF0gSUNNUDogMTY5LjI1NC4xMjgu
MTUgLT4KMTcyLjI3LjAuNiBwaW5nIHJlcXVlc3QsIHNlcTogNDgyMjAKWzEyNzIzNDkuNjE0NzE1
XSBbY29uc3VtZV9za2IgICAgICAgICBdIElDTVA6IDE2OS4yNTQuMTI4LjE1IC0+CjE3Mi4yNy4w
LjYgcGluZyByZXF1ZXN0LCBzZXE6IDQ4MjIwClsxMjcyMzQ5LjYxNDcyMl0gW3BhY2tldF9yY3Yg
ICAgICAgICAgXSBJQ01QOiAxNjkuMjU0LjEyOC4xNSAtPgoxNzIuMjcuMC42IHBpbmcgcmVxdWVz
dCwgc2VxOiA0ODIyMApbMTI3MjM0OS42MTQ3MjVdIFtjb25zdW1lX3NrYiAgICAgICAgIF0gSUNN
UDogMTY5LjI1NC4xMjguMTUgLT4KMTcyLjI3LjAuNiBwaW5nIHJlcXVlc3QsIHNlcTogNDgyMjAK
CkZvciBub3csIEkgaGF2ZSB0byBjcmVhdGUgYSBicGYgcHJvZ3JhbSBmb3IgZXZlcnkga2VybmVs
CmZ1bmN0aW9uIHRoYXQgSSB3YW50IHRvIHRyYWNlLCB3aGljaCBpcyB1cCB0byAyMDAuCgpXaXRo
IHRoaXMgbXVsdGktbGluaywgSSBvbmx5IG5lZWQgdG8gY3JlYXRlIDUgYnBmIHByb2dyYW0sCmxp
a2UgdGhpczoKCmludCBCUEZfUFJPRyh0cmFjZV9za2JfMSwgc3RydWN0ICpza2IpOwppbnQgQlBG
X1BST0codHJhY2Vfc2tiXzIsIHU2NCBhcmcwLCBzdHJ1Y3QgKnNrYik7CmludCBCUEZfUFJPRyh0
cmFjZV9za2JfMywgdTY0IGFyZzAsIHU2NCBhcmcxLCBzdHJ1Y3QgKnNrYik7CmludCBCUEZfUFJP
Ryh0cmFjZV9za2JfNCwgdTY0IGFyZzAsIHU2NCBhcmcxLCB1NjQgYXJnMiwgc3RydWN0ICpza2Ip
OwppbnQgQlBGX1BST0codHJhY2Vfc2tiXzUsIHU2NCBhcmcwLCB1NjQgYXJnMSwgdTY0IGFyZzIs
IHU2NCBhcmczLCBzdHJ1Y3QgKnNrYik7CgpUaGVuLCBJIGNhbiBhdHRhY2ggdHJhY2Vfc2tiXzEg
dG8gYWxsIHRoZSBrZXJuZWwgZnVuY3Rpb25zIHRoYXQKSSB3YW50IHRvIHRyYWNlIGFuZCB3aG9z
ZSBmaXJzdCBhcmcgaXMgc2tiOyBhdHRhY2ggdHJhY2Vfc2tiXzIgdG8ga2VybmVsCmZ1bmN0aW9u
cyB3aG9zZSAybmQgYXJnIGlzIHNrYiwgZXRjLgoKT3IsIEkgY2FuIGNyZWF0ZSBvbmx5IG9uZSBi
cGYgcHJvZ3JhbSBhbmQgc3RvcmUgdGhlIGluZGV4Cm9mIHNrYiB0byB0aGUgYXR0YWNobWVudCBj
b29raWUsIGFuZCBhdHRhY2ggdGhpcyBwcm9ncmFtIHRvIGFsbAp0aGUga2VybmVsIGZ1bmN0aW9u
cyB0aGF0IEkgd2FudCB0byB0cmFjZS4KClRoaXMgaXMgbXkgdXNlIGNhc2UuIFdpdGggdGhlIG11
bHRpLWxpbmssIG5vdyBJIG9ubHkgaGF2ZQoxIGJwZiBwcm9ncmFtLCAxIGJwZiBsaW5rLCAyMDAg
dHJhbXBvbGluZXMsIGluc3RlYWQgb2YgMjAwCmJwZiBwcm9ncmFtcywgMjAwIGJwZiBsaW5rIGFu
ZCAyMDAgdHJhbXBvbGluZXMuCgpUaGUgc2hhcmVkIHRyYW1wb2xpbmUgeW91IG1lbnRpb25lZCBz
ZWVtcyB0byBiZSBhCndvbmRlcmZ1bCBpZGVhLCB3aGljaCBjYW4gbWFrZSB0aGUgMjAwIHRyYW1w
b2xpbmVzCnRvIG9uZS4gTGV0IG1lIGhhdmUgYSBsb29rLCB3ZSBjcmVhdGUgYSB0cmFtcG9saW5l
IGFuZApyZWNvcmQgdGhlIG1heCBhcmdzIGNvdW50IG9mIGFsbCB0aGUgdGFyZ2V0IGZ1bmN0aW9u
cywgbGV0J3MKbWFyayBpdCBhcyBhcmdfY291bnQuCgpEdXJpbmcgZ2VuZXJhdGluZyB0aGUgdHJh
bXBvbGluZSwgd2UgYXNzdW1lIHRoYXQgdGhlCmZ1bmN0aW9uIGFyZ3MgY291bnQgaXMgYXJnX2Nv
dW50LiBEdXJpbmcgYXR0YWNoaW5nLCB3ZQpjaGVjayB0aGUgY29uc2lzdGVuY3kgb2YgYWxsIHRo
ZSB0YXJnZXQgZnVuY3Rpb25zLCBqdXN0IGxpa2UKd2hhdCB3ZSBkbyBub3cuCgpBbSBJIHJpZ2h0
PwoKVGhhbmtzIQpNZW5nbG9uZyBEb25nCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LXJpc2N2Cg==
