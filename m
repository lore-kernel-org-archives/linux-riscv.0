Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A813C77B75
	for <linux-riscv@archiver.kernel.org>; Tue, 18 Apr 2023 18:16:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YHYwUS+kGdZkXxjRn9B5QI0AeXHfEqq0cGaQTBB3ROA=; b=vi+lcbhO68Sqot
	YF/q98ToysKpAZKNmxcuScq0WkXHquJTYEpVARBVEUUbGI1d3U259MBCSCw0ODbXxrPAf+YnGTQwc
	pdbqlyxSdeFCY/aTIueW+toryga37dXAtOBAshg8FhNrWTQVvP3f4YBZdlSLPa348nF2IJvJ53dA9
	M7nct12e2PGr2xqDqoK03MSBTSbekd2q5iXUO9XPk2tU5i6OHdF02TFHNJAPlpkbgiNac9Cz0gaPv
	STLwfysYK5N6Ik8r7gF7FAMhS8YiSzbC4RAcHapwx6mY/k2KuD/RAeUuIy9vi0hUMbbEP3YaQC638
	vkeybvA2DZgfAOU3bQMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1popsJ-0032JO-0s;
	Tue, 18 Apr 2023 18:16:19 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1popsF-0032Hm-1y
	for linux-riscv@lists.infradead.org;
	Tue, 18 Apr 2023 18:16:17 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-3f08b6a9f8aso67975e9.0
        for <linux-riscv@lists.infradead.org>; Tue, 18 Apr 2023 11:16:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1681841771; x=1684433771;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Uzk00VVwAMnUgl8nqdf7G+u1lGlONN9yY2/sgJWoENw=;
        b=nVANayyNWQEEcixXLqV58hlA44rj6vtMwQer5ALpXD+J7VO5ysQutiY7HHiuVoz8F+
         yORfLruneACibPMnxRaVgKWwcMZVcMD9oFIhFI67ivS4lcNI+4TRMk9rtITgyWkXMNNd
         PlCuhCVu8rfB3QxBCZQCgaDOC1FDvoVj1H5R5FnFIc1PqdCrK/uiOqLTVShiSQ7M170d
         VEdup8js/MK8j0kVW+RDn+EEyfkMLCIX7k1ylHxCZlM1YJnlk7+R1enDl3Iq+wHyzLDa
         deRchW644KPY6XyWgOy4AczDdGW3MUgxI3c4nJ7bH6UddtzrMLoK7+huqXWBBoG+hvlf
         zj4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681841771; x=1684433771;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Uzk00VVwAMnUgl8nqdf7G+u1lGlONN9yY2/sgJWoENw=;
        b=BpwVb1Nq7JLZCVhgbcasIeb9Hnq313xT05iIZUSk8vAEUhMcl8Bv+aKwjMK9RqxeNq
         65Tf5pmeXvMvhJlic+oAL92FqviRW+qy9yxtEMwL5pOEnxY6LMiZ90+H6DoyeYtfqQ5G
         0q2CymgqwVH8IjrnXCPBHARB/KQ4IxMTyngtUfheQJBDg4HJFWqerS8aVrD4SW1TiTGu
         i7D9yWNMx4FUhEck2IM7aJeUTAqCkSboa+NNbV5B16mdF2vbE4eb6fTI+g7p9fFZ45vW
         rn+alrd4f8h9LlIkSELaMSCuRIOk+eMx6GxwjQHfKu/JDECTS3OuUkS4aV5dEngzr4iC
         PcCQ==
X-Gm-Message-State: AAQBX9fk5uiPFqiRZ0e6dkmGeD4z+ND84Xv0kkK225o6e4kAXUBeqOmt
	AOwKET9/m7otjs99Lvq41ty4Hcr4C/q9Id8cVE21tQ==
X-Google-Smtp-Source: AKy350YlrlOxmvzog0f3D5uEtE7OfRYpZXxq6H5LRCHAsI0piErrBw4HBLPgJ3F/vVAjjDRqNTs1wro+Od2+A+R7Nms=
X-Received: by 2002:a05:600c:22c8:b0:3f1:758c:dd23 with SMTP id
 8-20020a05600c22c800b003f1758cdd23mr10353wmg.7.1681841770657; Tue, 18 Apr
 2023 11:16:10 -0700 (PDT)
MIME-Version: 1.0
References: <20230413161725.195417-1-alexghiti@rivosinc.com>
 <CAOnJCU+72PV1=o1c_TpogkmBT36278BneVWEMr1=tqX0CZi+ag@mail.gmail.com>
 <aadca595b4a24e36932ba41e61f4e263@AcuMS.aculab.com> <CAOnJCUJ7mY+fh9VqE4dRntnVAEAc26=NnOCPUqkXk6ky__cUZQ@mail.gmail.com>
In-Reply-To: <CAOnJCUJ7mY+fh9VqE4dRntnVAEAc26=NnOCPUqkXk6ky__cUZQ@mail.gmail.com>
From: Ian Rogers <irogers@google.com>
Date: Tue, 18 Apr 2023 11:15:56 -0700
Message-ID: <CAP-5=fUYJEecmhQVuvbM4ZoDP_Hj=2RKOgR4cKepU072Uy3xyw@mail.gmail.com>
Subject: Re: [PATCH 0/4] riscv: Allow userspace to directly access perf counters
To: Atish Patra <atishp@atishpatra.org>
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
X-CRM114-CacheID: sfid-20230418_111615_651744_ED18B712 
X-CRM114-Status: GOOD (  36.22  )
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

T24gVHVlLCBBcHIgMTgsIDIwMjMgYXQgOTo0M+KAr0FNIEF0aXNoIFBhdHJhIDxhdGlzaHBAYXRp
c2hwYXRyYS5vcmc+IHdyb3RlOgo+Cj4gT24gRnJpLCBBcHIgMTQsIDIwMjMgYXQgMjo0MOKAr0FN
IERhdmlkIExhaWdodCA8RGF2aWQuTGFpZ2h0QGFjdWxhYi5jb20+IHdyb3RlOgo+ID4KPiA+IEZy
b206IEF0aXNoIFBhdHJhCj4gPiA+IFNlbnQ6IDEzIEFwcmlsIDIwMjMgMjA6MTgKPiA+ID4KPiA+
ID4gT24gVGh1LCBBcHIgMTMsIDIwMjMgYXQgOTo0N+KAr1BNIEFsZXhhbmRyZSBHaGl0aSA8YWxl
eGdoaXRpQHJpdm9zaW5jLmNvbT4gd3JvdGU6Cj4gPiA+ID4KPiA+ID4gPiByaXNjdiB1c2VkIHRv
IGFsbG93IGRpcmVjdCBhY2Nlc3MgdG8gY3ljbGUvdGltZS9pbnN0cmV0IGNvdW50ZXJzLAo+ID4g
PiA+IGJ5cGFzc2luZyB0aGUgcGVyZiBmcmFtZXdvcmssIHRoaXMgcGF0Y2hzZXQgaW50ZW5kcyB0
byBhbGxvdyB0aGUgdXNlciB0bwo+ID4gPiA+IG1tYXAgYW55IGNvdW50ZXIgd2hlbiBhY2Nlc3Nl
ZCB0aHJvdWdoIHBlcmYuIEJ1dCB3ZSBjYW4ndCBicmVhayB0aGUKPiA+ID4gPiBleGlzdGluZyBi
ZWhhdmlvdXIgc28gd2UgaW50cm9kdWNlIGEgc3lzY3RsIHBlcmZfdXNlcl9hY2Nlc3MgbGlrZSBh
cm02NAo+ID4gPiA+IGRvZXMsIHdoaWNoIGRlZmF1bHRzIHRvIHRoZSBsZWdhY3kgbW9kZSBkZXNj
cmliZWQgYWJvdmUuCj4gPiA+ID4KPiA+ID4KPiA+ID4gSXQgd291bGQgYmUgZ29vZCBwcm92aWRl
IGFkZGl0aW9uYWwgZGlyZWN0aW9uIGZvciB1c2VyIHNwYWNlIHBhY2thZ2VzOgo+ID4gPgo+ID4g
PiBUaGUgbGVnYWN5IGJlaGF2aW9yIGlzIHN1cHBvcnRlZCBmb3Igbm93IGluIG9yZGVyIHRvIGF2
b2lkIGJyZWFraW5nCj4gPiA+IGV4aXN0aW5nIHNvZnR3YXJlLgo+ID4gPiBIb3dldmVyLCByZWFk
aW5nIGNvdW50ZXJzIGRpcmVjdGx5IHdpdGhvdXQgcGVyZiBpbnRlcmFjdGlvbiBtYXkKPiA+ID4g
cHJvdmlkZSBpbmNvcnJlY3QgdmFsdWVzIHdoaWNoCj4gPiA+IHRoZSB1c2Vyc3BhY2Ugc29mdHdh
cmUgbXVzdCBhdm9pZC4gV2UgYXJlIGhvcGluZyB0aGF0IHRoZSB1c2VyIHNwYWNlCj4gPiA+IHBh
Y2thZ2VzIHdoaWNoCj4gPiA+IHJlYWQgdGhlIGN5Y2xlL2luc3RyZXQgZGlyZWN0bHksIHdpbGwg
bW92ZSB0byB0aGUgcHJvcGVyIGludGVyZmFjZQo+ID4gPiBldmVudHVhbGx5IGlmIHRoZXkgYWN0
dWFsbHkgbmVlZCBpdC4KPiA+ID4gTW9zdCBvZiB0aGUgdXNlcnMgYXJlIHN1cHBvc2VkIHRvIHJl
YWQgInRpbWUiIGluc3RlYWQgb2YgImN5Y2xlIiBpZgo+ID4gPiB0aGV5IGludGVuZCB0byByZWFk
IHRpbWVzdGFtcHMuCj4gPgo+ID4gSWYgeW91IGFyZSB0cnlpbmcgdG8gbWVhc3VyZSB0aGUgcGVy
Zm9ybWFuY2Ugb2Ygc2hvcnQgY29kZQo+ID4gZnJhZ21lbnRzIHRoZW4geW91IG5lZWQgcHJldHR5
IG11Y2ggcmF3IGFjY2VzcyBkaXJlY3RseSB0bwo+ID4gdGhlIGN5Y2xlL2Nsb2NrIGNvdW50IHJl
Z2lzdGVyLgo+ID4KPiA+IEkndmUgZG9uZSB0aGlzIG9uIHg4NiB0byBjb21wYXJlIHRoZSBhY3R1
YWwgY3ljbGUgdGltZXMKPiA+IG9mIGRpZmZlcmVudCBpbXBsZW1lbnRhdGlvbnMgb2YgdGhlIElQ
IGNoZWNrc3VtIGxvb3AKPiA+IChhbmQgY29tcGFyZSB0aGVtIHRvIHRoZSB0aGVvcmV0aWNhbCBs
aW1pdCkuCj4gPiBUaGUgcGVyZiBmcmFtZXdvcmsganVzdCBhZGRlZCBmYXIgdG9vIG11Y2ggbGF0
ZW5jeSwKPiA+IG9ubHkgZGlyZWN0bHkgcmVhZGluZyB0aGUgY3B1IHJlZ2lzdGVycyBnYXZlIGFu
eXRoaW5nCj4gPiBsaWtlIHJlbGlhYmxlIChhbmQgY29uc2lzdGVudCkgYW5zd2Vycy4KPiA+Cj4K
PiBUaGlzIHNlcmllcyBhbGxvd3MgZGlyZWN0IGFjY2VzcyB0byB0aGUgY291bnRlcnMgb25jZSBj
b25maWd1cmVkCj4gdGhyb3VnaCB0aGUgcGVyZi4KPiBFYXJsaWVyIHRoZSBjeWNsZS9pbnN0cmV0
IGNvdW50ZXJzIGFyZSBkaXJlY3RseSBleHBvc2VkIHRvIHRoZQo+IHVzZXJzcGFjZSB3aXRob3V0
IGtlcm5lbC9wZXJmIGZyYW1ld29ya2luZyBrbm93aW5nCj4gd2hlbi93aGljaCB1c2VyIHNwYWNl
IGFwcGxpY2F0aW9uIGlzIHJlYWRpbmcgaXQuIFRoYXQgaGFzIHNlY3VyaXR5IGltcGxpY2F0aW9u
cy4KPgo+IFdpdGggdGhpcyBzZXJpZXMgYXBwbGllZCwgdGhlIHVzZXIgc3BhY2UgYXBwbGljYXRp
b24ganVzdCBuZWVkcyB0bwo+IGNvbmZpZ3VyZSB0aGUgZXZlbnQgKGN5Y2xlL2luc3RyZXQpIHRo
cm91Z2ggcGVyZiBzeXNjYWxsLgo+IE9uY2UgY29uZmlndXJlZCwgdGhlIHVzZXJzcGFjZSBhcHBs
aWNhdGlvbiBjYW4gZmluZCBvdXQgdGhlIGNvdW50ZXIKPiBpbmZvcm1hdGlvbiBmcm9tIHRoZSBt
bWFwICYgZGlyZWN0bHkKPiByZWFkIHRoZSBjb3VudGVyLiBUaGVyZSBpcyBubyBsYXRlbmN5IHdo
aWxlIHJlYWRpbmcgdGhlIGNvdW50ZXJzLgo+Cj4gVGhpcyBtZWNoYW5pc20gYWxsb3dzIHN0b3Av
Y2xlYXIgdGhlIGNvdW50ZXJzIHdoZW4gdGhlIHJlcXVlc3RpbmcgdGFzawo+IGlzIG5vdCBydW5u
aW5nLiBJdCBhbHNvIHRha2VzIGNhcmUgb2YgY29udGV4dCBzd2l0Y2hpbmcKPiB3aGljaCBtYXkg
cmVzdWx0IGluIGludmFsaWQgdmFsdWVzIGFzIHlvdSBtZW50aW9uZWQgYmVsb3cuIFRoaXMgaXMK
PiBub3RoaW5nIG5ldyBhbmQgYWxsIG90aGVyIGFyY2ggKHg4NiwgQVJNNjQpIGFsbG93IHVzZXIg
c3BhY2UKPiBjb3VudGVyIHJlYWQgdGhyb3VnaCB0aGUgc2FtZSBtZWNoYW5pc20uCj4KPiBIZXJl
IGlzIHRoZSByZWxldmFudCB1cHN0cmVhbSBkaXNjdXNzaW9uOgo+IGh0dHBzOi8vbG9yZS5rZXJu
ZWwub3JnL2xrbWwvWTd3TGE3STJobHozckt3JTJGQGhpcmV6LnByb2dyYW1taW5nLmtpY2tzLWFz
cy5uZXQvVC8KPgo+IEFSTTY0Ogo+IGh0dHBzOi8vZG9jcy5rZXJuZWwub3JnL2FybTY0L3BlcmYu
aHRtbD9oaWdobGlnaHQ9cGVyZl91c2VyX2FjY2VzcyNwZXJmLXVzZXJzcGFjZS1wbXUtaGFyZHdh
cmUtY291bnRlci1hY2Nlc3MKPgo+IGV4YW1wbGUgdXNhZ2UgaW4geDg2Ogo+IGh0dHBzOi8vZ2l0
aHViLmNvbS9hbmRpa2xlZW4vcG11LXRvb2xzL2Jsb2IvbWFzdGVyL2pldmVudHMvcmRwbWMuYwoK
VGhlIGNhbm9uaWNhbCBpbXBsZW1lbnRhdGlvbiBvZiB0aGlzIHNob3VsZCBiZToKaHR0cHM6Ly9n
aXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvdG9ydmFsZHMvbGludXguZ2l0
L3RyZWUvdG9vbHMvbGliL3BlcmYvbW1hcC5jI240MDAKd2hpY2ggaXMgdXBkYXRlZCBpbiB0aGVz
ZSBwYXRjaGVzIGJ1dCB0aGUgdGVzdHMgYXJlIG5vdDoKaHR0cHM6Ly9naXQua2VybmVsLm9yZy9w
dWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvdG9ydmFsZHMvbGludXguZ2l0L3RyZWUvdG9vbHMvcGVy
Zi90ZXN0cy9tbWFwLWJhc2ljLmMjbjI4NwpXaGljaCBhcHBlYXJzIHRvIGJlIGFuIG92ZXJzaWdo
dC4gVGhlIHRlc3RzIGRpc3BsYXkgc29tZSBkaWZmZXJlbmNlcwpiZXR3ZWVuIHg4NiBhbmQgYWFy
Y2g2NCB0aGF0IGhhdmUgYXNzdW1lZCB1c2Vyc3BhY2UgaGFyZHdhcmUgY291bnRlcgphY2Nlc3Ms
IGFuZCBldmVyeXRoaW5nIGVsc2UgdGhhdCBpdCBpcyBhc3N1bWVkIGRvbid0LgoKVGhhbmtzLApJ
YW4KCj4gPiBDbGVhcmx5IHByb2Nlc3Mgc3dpdGNoZXMgKGVzcGVjaWFsbHkgY3B1IG1pZ3JhdGlv
bnMpIGNhdXNlCj4gPiBwcm9ibGVtcywgYnV0IHRoZXkgYXJlIG9idmlvdXNseSBpbnZhbGlkIHZh
bHVlcyBhbmQgY2FuCj4gPiBiZSBpZ25vcmVkLgo+ID4KPiA+IFNvIHdoaWxlIGEgbG90IG9mIHVz
ZXMgbWF5IGJlICdoYXBweScgd2l0aCB0aGUgdmFsdWVzIHRoZQo+ID4gcGVyZiBmcmFtZXdvcmsg
Z2l2ZXMsIHNvbWV0aW1lcyB5b3UgZG8gbmVlZCB0byBkaXJlY3RseQo+ID4gcmVhZCB0aGUgcmVs
ZXZhbnQgcmVnaXN0ZXJzLgo+ID4KPiA+ICAgICAgICAgRGF2aWQKPiA+Cj4gPiAtCj4gPiBSZWdp
c3RlcmVkIEFkZHJlc3MgTGFrZXNpZGUsIEJyYW1sZXkgUm9hZCwgTW91bnQgRmFybSwgTWlsdG9u
IEtleW5lcywgTUsxIDFQVCwgVUsKPiA+IFJlZ2lzdHJhdGlvbiBObzogMTM5NzM4NiAoV2FsZXMp
Cj4KPgo+Cj4gLS0KPiBSZWdhcmRzLAo+IEF0aXNoCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlz
Y3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
