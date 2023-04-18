Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77291C77B75
	for <linux-riscv@archiver.kernel.org>; Tue, 18 Apr 2023 20:30:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4ccZavu18jwP+l6gtSjK5YiYLcIdROBoi4mS+Rl1w+4=; b=jI3FP+XJIuMP8K
	Iu3oH90/OHlBfX/JuMTvRrZpDUrDQkeVxslLwLJkF84wirIjyPLFPUdjUAoU0hg0GdbRITfKCYkEk
	ZG2tgwU8cuK0hVecpTKq/O39WacxzKhomME6zRz2WE3IDFzqcOJVUaD6lFmB389MTGdhb/tikukhV
	IuALvK3/92DFjAgeJ4JdK9iFNV/RT7LtcXYuhzYjaWWUBASdCplXjdh0dBc9nun4iuLZfU4zuV9fK
	r+OjrJWy5WA/TGcL7kyqeg/hF4xrEgVA9f9Y8DV7JUvzj9+aZf0f4lbLgCM8zYHy+EKDSRnEqzA+4
	YguTqpmO+J4bbm5ptJBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1poryF-003I03-2r;
	Tue, 18 Apr 2023 20:30:35 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1poryC-003HyJ-2p
	for linux-riscv@lists.infradead.org;
	Tue, 18 Apr 2023 20:30:34 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-246bb512038so2218306a91.1
        for <linux-riscv@lists.infradead.org>; Tue, 18 Apr 2023 13:30:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=atishpatra.org; s=google; t=1681849831; x=1684441831;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=758KJFnubLFSsZj7NLSbl2wQ+MQOeQGEXb82zXsrHA8=;
        b=JKWc07Hsa1AIwKVKIMzXI4sw331w8kX1TDKqtQB//KSPOSUQN+tk39Ofo87lgk87cs
         A++4AkL4VO7Zo172B6EmKiVr7FrbMePdElPSloCsouI2E/r/+XOY/fDC60aCptlCrI9z
         Pj+V02e4O7mTkISl5wP8rj3Y1EWU2fzkx9GVY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681849831; x=1684441831;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=758KJFnubLFSsZj7NLSbl2wQ+MQOeQGEXb82zXsrHA8=;
        b=HpmY9ePD1wKCNoGMzvP6QqWs70BMaI09VDMc2vu0YKSkRnlGNvgQU6UW38m+83xTIu
         Eayfwrno9vhILypMyg3dMkJAyyMZJe47DhOiA0ugMhAgqJaTlGYT26zNa+FrcXOrDtug
         PqxTirDuomZH37Awwgao/v1wZlQ/eJZWr600f8U1eRSf9iZDWQl2K0cnP+UM6URPOeKP
         b3X+DAQEVScAsYnWrZ5Ai9g21EwdO86y3tI5B5p0NPHmiO8mhT6Johba/mFJaSTMG2xS
         kL+nuchHVO++YSlWwML5iP2koiEgkjrP+Zu4BTEKxToI1SKunaqrsfm+NIP1a5HEqP1Z
         qb4g==
X-Gm-Message-State: AAQBX9ckqTO1nA90eWfkJ29xa4owbqgri7WxRH9R0FiGBMwJZvoWtfBc
	4oaPwikyM6krOdW7CzG/IW5hfMIzjS/fNtPNlfkc
X-Google-Smtp-Source: AKy350ZIg+M7FnY7uohsy0MLIS1rdUP3e5Y8mF0C/rJh0Ab5JDC3yj3RoFOx5gy5nC7akfL3LOBt0QioDaAyr1DFD3g=
X-Received: by 2002:a17:90a:4706:b0:23d:1121:f211 with SMTP id
 h6-20020a17090a470600b0023d1121f211mr293761pjg.5.1681849830738; Tue, 18 Apr
 2023 13:30:30 -0700 (PDT)
MIME-Version: 1.0
References: <20230413161725.195417-1-alexghiti@rivosinc.com>
 <CAOnJCU+72PV1=o1c_TpogkmBT36278BneVWEMr1=tqX0CZi+ag@mail.gmail.com>
 <aadca595b4a24e36932ba41e61f4e263@AcuMS.aculab.com> <CAOnJCUJ7mY+fh9VqE4dRntnVAEAc26=NnOCPUqkXk6ky__cUZQ@mail.gmail.com>
 <CAP-5=fUYJEecmhQVuvbM4ZoDP_Hj=2RKOgR4cKepU072Uy3xyw@mail.gmail.com>
In-Reply-To: <CAP-5=fUYJEecmhQVuvbM4ZoDP_Hj=2RKOgR4cKepU072Uy3xyw@mail.gmail.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Wed, 19 Apr 2023 02:00:18 +0530
Message-ID: <CAOnJCULJfSN79MzAwhCrbVzG1rYyrPB3OraFmoZFBxuRCwq01w@mail.gmail.com>
Subject: Re: [PATCH 0/4] riscv: Allow userspace to directly access perf counters
To: Ian Rogers <irogers@google.com>
Cc: David Laight <David.Laight@aculab.com>, Alexandre Ghiti <alexghiti@rivosinc.com>, 
	Jonathan Corbet <corbet@lwn.net>, Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Namhyung Kim <namhyung@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Anup Patel <anup@brainfault.org>, Will Deacon <will@kernel.org>, Rob Herring <robh@kernel.org>, 
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-perf-users@vger.kernel.org" <linux-perf-users@vger.kernel.org>, 
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, paranlee <p4ranlee@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230418_133033_073008_E0C5A63A 
X-CRM114-Status: GOOD (  39.17  )
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

T24gVHVlLCBBcHIgMTgsIDIwMjMgYXQgMTE6NDbigK9QTSBJYW4gUm9nZXJzIDxpcm9nZXJzQGdv
b2dsZS5jb20+IHdyb3RlOgo+Cj4gT24gVHVlLCBBcHIgMTgsIDIwMjMgYXQgOTo0M+KAr0FNIEF0
aXNoIFBhdHJhIDxhdGlzaHBAYXRpc2hwYXRyYS5vcmc+IHdyb3RlOgo+ID4KPiA+IE9uIEZyaSwg
QXByIDE0LCAyMDIzIGF0IDI6NDDigK9BTSBEYXZpZCBMYWlnaHQgPERhdmlkLkxhaWdodEBhY3Vs
YWIuY29tPiB3cm90ZToKPiA+ID4KPiA+ID4gRnJvbTogQXRpc2ggUGF0cmEKPiA+ID4gPiBTZW50
OiAxMyBBcHJpbCAyMDIzIDIwOjE4Cj4gPiA+ID4KPiA+ID4gPiBPbiBUaHUsIEFwciAxMywgMjAy
MyBhdCA5OjQ34oCvUE0gQWxleGFuZHJlIEdoaXRpIDxhbGV4Z2hpdGlAcml2b3NpbmMuY29tPiB3
cm90ZToKPiA+ID4gPiA+Cj4gPiA+ID4gPiByaXNjdiB1c2VkIHRvIGFsbG93IGRpcmVjdCBhY2Nl
c3MgdG8gY3ljbGUvdGltZS9pbnN0cmV0IGNvdW50ZXJzLAo+ID4gPiA+ID4gYnlwYXNzaW5nIHRo
ZSBwZXJmIGZyYW1ld29yaywgdGhpcyBwYXRjaHNldCBpbnRlbmRzIHRvIGFsbG93IHRoZSB1c2Vy
IHRvCj4gPiA+ID4gPiBtbWFwIGFueSBjb3VudGVyIHdoZW4gYWNjZXNzZWQgdGhyb3VnaCBwZXJm
LiBCdXQgd2UgY2FuJ3QgYnJlYWsgdGhlCj4gPiA+ID4gPiBleGlzdGluZyBiZWhhdmlvdXIgc28g
d2UgaW50cm9kdWNlIGEgc3lzY3RsIHBlcmZfdXNlcl9hY2Nlc3MgbGlrZSBhcm02NAo+ID4gPiA+
ID4gZG9lcywgd2hpY2ggZGVmYXVsdHMgdG8gdGhlIGxlZ2FjeSBtb2RlIGRlc2NyaWJlZCBhYm92
ZS4KPiA+ID4gPiA+Cj4gPiA+ID4KPiA+ID4gPiBJdCB3b3VsZCBiZSBnb29kIHByb3ZpZGUgYWRk
aXRpb25hbCBkaXJlY3Rpb24gZm9yIHVzZXIgc3BhY2UgcGFja2FnZXM6Cj4gPiA+ID4KPiA+ID4g
PiBUaGUgbGVnYWN5IGJlaGF2aW9yIGlzIHN1cHBvcnRlZCBmb3Igbm93IGluIG9yZGVyIHRvIGF2
b2lkIGJyZWFraW5nCj4gPiA+ID4gZXhpc3Rpbmcgc29mdHdhcmUuCj4gPiA+ID4gSG93ZXZlciwg
cmVhZGluZyBjb3VudGVycyBkaXJlY3RseSB3aXRob3V0IHBlcmYgaW50ZXJhY3Rpb24gbWF5Cj4g
PiA+ID4gcHJvdmlkZSBpbmNvcnJlY3QgdmFsdWVzIHdoaWNoCj4gPiA+ID4gdGhlIHVzZXJzcGFj
ZSBzb2Z0d2FyZSBtdXN0IGF2b2lkLiBXZSBhcmUgaG9waW5nIHRoYXQgdGhlIHVzZXIgc3BhY2UK
PiA+ID4gPiBwYWNrYWdlcyB3aGljaAo+ID4gPiA+IHJlYWQgdGhlIGN5Y2xlL2luc3RyZXQgZGly
ZWN0bHksIHdpbGwgbW92ZSB0byB0aGUgcHJvcGVyIGludGVyZmFjZQo+ID4gPiA+IGV2ZW50dWFs
bHkgaWYgdGhleSBhY3R1YWxseSBuZWVkIGl0Lgo+ID4gPiA+IE1vc3Qgb2YgdGhlIHVzZXJzIGFy
ZSBzdXBwb3NlZCB0byByZWFkICJ0aW1lIiBpbnN0ZWFkIG9mICJjeWNsZSIgaWYKPiA+ID4gPiB0
aGV5IGludGVuZCB0byByZWFkIHRpbWVzdGFtcHMuCj4gPiA+Cj4gPiA+IElmIHlvdSBhcmUgdHJ5
aW5nIHRvIG1lYXN1cmUgdGhlIHBlcmZvcm1hbmNlIG9mIHNob3J0IGNvZGUKPiA+ID4gZnJhZ21l
bnRzIHRoZW4geW91IG5lZWQgcHJldHR5IG11Y2ggcmF3IGFjY2VzcyBkaXJlY3RseSB0bwo+ID4g
PiB0aGUgY3ljbGUvY2xvY2sgY291bnQgcmVnaXN0ZXIuCj4gPiA+Cj4gPiA+IEkndmUgZG9uZSB0
aGlzIG9uIHg4NiB0byBjb21wYXJlIHRoZSBhY3R1YWwgY3ljbGUgdGltZXMKPiA+ID4gb2YgZGlm
ZmVyZW50IGltcGxlbWVudGF0aW9ucyBvZiB0aGUgSVAgY2hlY2tzdW0gbG9vcAo+ID4gPiAoYW5k
IGNvbXBhcmUgdGhlbSB0byB0aGUgdGhlb3JldGljYWwgbGltaXQpLgo+ID4gPiBUaGUgcGVyZiBm
cmFtZXdvcmsganVzdCBhZGRlZCBmYXIgdG9vIG11Y2ggbGF0ZW5jeSwKPiA+ID4gb25seSBkaXJl
Y3RseSByZWFkaW5nIHRoZSBjcHUgcmVnaXN0ZXJzIGdhdmUgYW55dGhpbmcKPiA+ID4gbGlrZSBy
ZWxpYWJsZSAoYW5kIGNvbnNpc3RlbnQpIGFuc3dlcnMuCj4gPiA+Cj4gPgo+ID4gVGhpcyBzZXJp
ZXMgYWxsb3dzIGRpcmVjdCBhY2Nlc3MgdG8gdGhlIGNvdW50ZXJzIG9uY2UgY29uZmlndXJlZAo+
ID4gdGhyb3VnaCB0aGUgcGVyZi4KPiA+IEVhcmxpZXIgdGhlIGN5Y2xlL2luc3RyZXQgY291bnRl
cnMgYXJlIGRpcmVjdGx5IGV4cG9zZWQgdG8gdGhlCj4gPiB1c2Vyc3BhY2Ugd2l0aG91dCBrZXJu
ZWwvcGVyZiBmcmFtZXdvcmtpbmcga25vd2luZwo+ID4gd2hlbi93aGljaCB1c2VyIHNwYWNlIGFw
cGxpY2F0aW9uIGlzIHJlYWRpbmcgaXQuIFRoYXQgaGFzIHNlY3VyaXR5IGltcGxpY2F0aW9ucy4K
PiA+Cj4gPiBXaXRoIHRoaXMgc2VyaWVzIGFwcGxpZWQsIHRoZSB1c2VyIHNwYWNlIGFwcGxpY2F0
aW9uIGp1c3QgbmVlZHMgdG8KPiA+IGNvbmZpZ3VyZSB0aGUgZXZlbnQgKGN5Y2xlL2luc3RyZXQp
IHRocm91Z2ggcGVyZiBzeXNjYWxsLgo+ID4gT25jZSBjb25maWd1cmVkLCB0aGUgdXNlcnNwYWNl
IGFwcGxpY2F0aW9uIGNhbiBmaW5kIG91dCB0aGUgY291bnRlcgo+ID4gaW5mb3JtYXRpb24gZnJv
bSB0aGUgbW1hcCAmIGRpcmVjdGx5Cj4gPiByZWFkIHRoZSBjb3VudGVyLiBUaGVyZSBpcyBubyBs
YXRlbmN5IHdoaWxlIHJlYWRpbmcgdGhlIGNvdW50ZXJzLgo+ID4KPiA+IFRoaXMgbWVjaGFuaXNt
IGFsbG93cyBzdG9wL2NsZWFyIHRoZSBjb3VudGVycyB3aGVuIHRoZSByZXF1ZXN0aW5nIHRhc2sK
PiA+IGlzIG5vdCBydW5uaW5nLiBJdCBhbHNvIHRha2VzIGNhcmUgb2YgY29udGV4dCBzd2l0Y2hp
bmcKPiA+IHdoaWNoIG1heSByZXN1bHQgaW4gaW52YWxpZCB2YWx1ZXMgYXMgeW91IG1lbnRpb25l
ZCBiZWxvdy4gVGhpcyBpcwo+ID4gbm90aGluZyBuZXcgYW5kIGFsbCBvdGhlciBhcmNoICh4ODYs
IEFSTTY0KSBhbGxvdyB1c2VyIHNwYWNlCj4gPiBjb3VudGVyIHJlYWQgdGhyb3VnaCB0aGUgc2Ft
ZSBtZWNoYW5pc20uCj4gPgo+ID4gSGVyZSBpcyB0aGUgcmVsZXZhbnQgdXBzdHJlYW0gZGlzY3Vz
c2lvbjoKPiA+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xrbWwvWTd3TGE3STJobHozckt3JTJG
QGhpcmV6LnByb2dyYW1taW5nLmtpY2tzLWFzcy5uZXQvVC8KPiA+Cj4gPiBBUk02NDoKPiA+IGh0
dHBzOi8vZG9jcy5rZXJuZWwub3JnL2FybTY0L3BlcmYuaHRtbD9oaWdobGlnaHQ9cGVyZl91c2Vy
X2FjY2VzcyNwZXJmLXVzZXJzcGFjZS1wbXUtaGFyZHdhcmUtY291bnRlci1hY2Nlc3MKPiA+Cj4g
PiBleGFtcGxlIHVzYWdlIGluIHg4NjoKPiA+IGh0dHBzOi8vZ2l0aHViLmNvbS9hbmRpa2xlZW4v
cG11LXRvb2xzL2Jsb2IvbWFzdGVyL2pldmVudHMvcmRwbWMuYwo+Cj4gVGhlIGNhbm9uaWNhbCBp
bXBsZW1lbnRhdGlvbiBvZiB0aGlzIHNob3VsZCBiZToKPiBodHRwczovL2dpdC5rZXJuZWwub3Jn
L3B1Yi9zY20vbGludXgva2VybmVsL2dpdC90b3J2YWxkcy9saW51eC5naXQvdHJlZS90b29scy9s
aWIvcGVyZi9tbWFwLmMjbjQwMAoKVGhhbmtzIGZvciBzaGFyaW5nIHRoZSBsaWJwZXJmIGltcGxl
bWVudGF0aW9uLgoKPiB3aGljaCBpcyB1cGRhdGVkIGluIHRoZXNlIHBhdGNoZXMgYnV0IHRoZSB0
ZXN0cyBhcmUgbm90Ogo+IGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJu
ZWwvZ2l0L3RvcnZhbGRzL2xpbnV4LmdpdC90cmVlL3Rvb2xzL3BlcmYvdGVzdHMvbW1hcC1iYXNp
Yy5jI24yODcKPiBXaGljaCBhcHBlYXJzIHRvIGJlIGFuIG92ZXJzaWdodC4gVGhlIHRlc3RzIGRp
c3BsYXkgc29tZSBkaWZmZXJlbmNlcwoKWWVzLiBJdCdzIGFuIG92ZXJzaWdodC4gV2Ugc2hvdWxk
IG1ha2Ugc3VyZSB0aGF0IHBlcmYgbW1hcCB0ZXN0cyBwYXNzCmZvciBSSVNDLVYgYXMgd2VsbC4K
Cgo+IGJldHdlZW4geDg2IGFuZCBhYXJjaDY0IHRoYXQgaGF2ZSBhc3N1bWVkIHVzZXJzcGFjZSBo
YXJkd2FyZSBjb3VudGVyCj4gYWNjZXNzLCBhbmQgZXZlcnl0aGluZyBlbHNlIHRoYXQgaXQgaXMg
YXNzdW1lZCBkb24ndC4KPgo+IFRoYW5rcywKPiBJYW4KPgo+ID4gPiBDbGVhcmx5IHByb2Nlc3Mg
c3dpdGNoZXMgKGVzcGVjaWFsbHkgY3B1IG1pZ3JhdGlvbnMpIGNhdXNlCj4gPiA+IHByb2JsZW1z
LCBidXQgdGhleSBhcmUgb2J2aW91c2x5IGludmFsaWQgdmFsdWVzIGFuZCBjYW4KPiA+ID4gYmUg
aWdub3JlZC4KPiA+ID4KPiA+ID4gU28gd2hpbGUgYSBsb3Qgb2YgdXNlcyBtYXkgYmUgJ2hhcHB5
JyB3aXRoIHRoZSB2YWx1ZXMgdGhlCj4gPiA+IHBlcmYgZnJhbWV3b3JrIGdpdmVzLCBzb21ldGlt
ZXMgeW91IGRvIG5lZWQgdG8gZGlyZWN0bHkKPiA+ID4gcmVhZCB0aGUgcmVsZXZhbnQgcmVnaXN0
ZXJzLgo+ID4gPgo+ID4gPiAgICAgICAgIERhdmlkCj4gPiA+Cj4gPiA+IC0KPiA+ID4gUmVnaXN0
ZXJlZCBBZGRyZXNzIExha2VzaWRlLCBCcmFtbGV5IFJvYWQsIE1vdW50IEZhcm0sIE1pbHRvbiBL
ZXluZXMsIE1LMSAxUFQsIFVLCj4gPiA+IFJlZ2lzdHJhdGlvbiBObzogMTM5NzM4NiAoV2FsZXMp
Cj4gPgo+ID4KPiA+Cj4gPiAtLQo+ID4gUmVnYXJkcywKPiA+IEF0aXNoCgoKCi0tClJlZ2FyZHMs
CkF0aXNoCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
