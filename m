Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2137AC4345F
	for <linux-riscv@archiver.kernel.org>; Sat, 27 Apr 2024 22:05:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MPR1j3JoUPTZOZ4J2DIZK35qOiZphbmEmT/sE2YCbEI=; b=toRczQhpb236Vk
	87qYEfF5ClsMbUCD6qmTzH2WIAeyqYPJ1FkkQmRw4/oDn1IyI0mqKWbK6xtLGK5qMzTWimTNN0juq
	+yw6PEGBJy5z7Hf9AKoGG+Tl6N27uxwO5PYUy+nVmh7hfma7ll6jmHke2oBijJUVB+xECOX3SoQ07
	ZNkZ3USQY0F+5C1ylXy20l5+SHnQKet+J89hvP5a+Bei9cLpOPBzwPJ+4ZKibYTuZCppmPTVqep0x
	SFafNSxSc8VFTUNeWR52AUyulWmvoSAhNqkplYpDi8qSab1w4ov6Z0w9PZF9eQhjAv+zhU1h7UwWk
	kzpBvRZsByNl+GbKZPAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s0qAb-0000000GJQb-23ts;
	Sat, 27 Apr 2024 22:05:21 +0000
Received: from mail-il1-x12e.google.com ([2607:f8b0:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s0qAY-0000000GJOR-0kO3
	for linux-riscv@lists.infradead.org;
	Sat, 27 Apr 2024 22:05:19 +0000
Received: by mail-il1-x12e.google.com with SMTP id e9e14a558f8ab-36b3738f01cso131985ab.0
        for <linux-riscv@lists.infradead.org>; Sat, 27 Apr 2024 15:05:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1714255515; x=1714860315; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ev2ja+lSmiOzY64QoBLLWUXCoL4iQJQ9t2WV8bOp35Q=;
        b=igYBMdOk0J5+LWaLOAqkMbh9ybipdXDOJ/8wsLpHYqLxVQnUrxiegRO2LJMkSoKWSK
         o4TgDhL3LGMLNxEI9XisEj3Q80geLHZkv1F4YI9JAE2MReUgE7g5q0JLDrWCqg+2VtSc
         gVS6zBUCFJLMVWn7nRUG39+ujZTvtIHaZ6QXPU4GRuJZYS3nRDt1slWZZ/Xi4es/Mj1i
         KnP8fZyFg3ku7KxCuDmRX/hblqrwXz9vNt4XV6HDgDEAbLNWn6PethTYeGly9uXrq1zy
         dBCnbKrrKWia6vfXQY9UNzsSUFx4ym1xMjKvzen5m85236WWW4DRAYUEIipQ1qjqEOza
         bFbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714255515; x=1714860315;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ev2ja+lSmiOzY64QoBLLWUXCoL4iQJQ9t2WV8bOp35Q=;
        b=e/dmTCwXpLsT3DqnpWT/9+R+AUmEEkYYOewVUXWEAEyyPF5RxHJNS7jyQLMv/ZFqYO
         NXI+LJF99khw1PwGlaBjdmX/4AQlpsNSb2zqHhcnu6XsDlxU08scntoV6AkIMU8rXu6t
         j6aIPJMmx1F3HdOaK9PcmdaL6QlmuPZQhVbIlpmvz0Kh2q5JVo9dk9wdyDpHH5fQqe8A
         cz6vsR5DtesmMrkYhym0Z9vrgFU1H3XjiUQ9Py9Aca14hGIkOpjVfcZ9hyJm8DELV5CN
         3v4qxNa5m4RxxSelO2NrTbx2bqgETlQhvfswKaLJ8X19UVer+yHw/Xu43nN8j7Xlyty/
         3DPA==
X-Forwarded-Encrypted: i=1; AJvYcCUuH0dwjFXtQelG9v8Og2vuyeQcejWOuLoHYXoS0LemX+5hSObsHD9D6MCyYnOK3BJSMD/FWNoW71UuOYKg+ckcrMxv4TP+0ZG8Y07hPDbY
X-Gm-Message-State: AOJu0YwJPWPB9/TC4RRtTj0OcFuczZY3aJgcI6/GQwK7ewrckbOutIeu
	9XiOwseAsLwMChPE/9fxPrt/gp/TuIq7mNrQGIrRxRG3tHrKp9jP4AFp39xJObyL5UQUE7ajHmg
	qkzKnGQFuieFs+5PqzQKW6eEUKU2TuHY5CBJm
X-Google-Smtp-Source: AGHT+IEO3FABo7bJtP1TZzhuy5KcTdsQQuF8Ot6ogc+4XIRMXJdBlJnjK+wLjTHicCMFRokmznKYolzRrUz6TLlZywU=
X-Received: by 2002:a92:cb52:0:b0:36c:38c9:c1ab with SMTP id
 f18-20020a92cb52000000b0036c38c9c1abmr210173ilq.26.1714255515191; Sat, 27 Apr
 2024 15:05:15 -0700 (PDT)
MIME-Version: 1.0
References: <20240416061533.921723-1-irogers@google.com> <20240416061533.921723-12-irogers@google.com>
 <ZixWfypP4FtKgv0F@x1> <ZixWn-ZCBpwH_2xp@x1>
In-Reply-To: <ZixWn-ZCBpwH_2xp@x1>
From: Ian Rogers <irogers@google.com>
Date: Sat, 27 Apr 2024 15:05:01 -0700
Message-ID: <CAP-5=fW-j03Rg9LyJqGJvU9w2Sm5hA+OcOAD=BCUbswKUh7yoA@mail.gmail.com>
Subject: Re: [PATCH v2 11/16] perf parse-events: Improve error message for bad numbers
To: Arnaldo Carvalho de Melo <acme@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, Kan Liang <kan.liang@linux.intel.com>, 
	James Clark <james.clark@arm.com>, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org, bpf@vger.kernel.org, 
	Atish Patra <atishp@rivosinc.com>, linux-riscv@lists.infradead.org, 
	Beeman Strong <beeman@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240427_150518_315660_5D5EEA71 
X-CRM114-Status: GOOD (  16.39  )
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

T24gRnJpLCBBcHIgMjYsIDIwMjQgYXQgNjozNuKAr1BNIEFybmFsZG8gQ2FydmFsaG8gZGUgTWVs
bwo8YWNtZUBrZXJuZWwub3JnPiB3cm90ZToKPgo+IE9uIEZyaSwgQXByIDI2LCAyMDI0IGF0IDEw
OjM2OjAyUE0gLTAzMDAsIEFybmFsZG8gQ2FydmFsaG8gZGUgTWVsbyB3cm90ZToKPiA+IE9uIE1v
biwgQXByIDE1LCAyMDI0IGF0IDExOjE1OjI3UE0gLTA3MDAsIElhbiBSb2dlcnMgd3JvdGU6Cj4g
PiA+IFVzZSB0aGUgZXJyb3IgaGFuZGxlciBmcm9tIHRoZSBwYXJzZV9zdGF0ZSB0byBnaXZlIGEg
bW9yZSBpbmZvcm1hdGl2ZQo+ID4gPiBlcnJvciBtZXNzYWdlLgo+ID4gPgo+ID4gPiBCZWZvcmU6
Cj4gPiA+IGBgYAo+ID4gPiAkIHBlcmYgc3RhdCAtZSAnY3ljbGVzL3BlcmlvZD05OTk5OTk5OTk5
OTk5OTk5OTk5OS8nIHRydWUKPiA+ID4gZXZlbnQgc3ludGF4IGVycm9yOiAnY3ljbGVzL3Blcmlv
ZD05OTk5OTk5OTk5OTk5OTk5OTk5OS8nCj4gPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBcX19fIHBhcnNlciBlcnJvcgo+ID4gPiBSdW4gJ3BlcmYgbGlzdCcgZm9yIGEgbGlz
dCBvZiB2YWxpZCBldmVudHMKPiA+ID4KPiA+ID4gIFVzYWdlOiBwZXJmIHN0YXQgWzxvcHRpb25z
Pl0gWzxjb21tYW5kPl0KPiA+ID4KPiA+ID4gICAgIC1lLCAtLWV2ZW50IDxldmVudD4gICBldmVu
dCBzZWxlY3Rvci4gdXNlICdwZXJmIGxpc3QnIHRvIGxpc3QgYXZhaWxhYmxlIGV2ZW50cwo+ID4g
PiBgYGAKPiA+ID4KPiA+ID4gQWZ0ZXI6Cj4gPiA+IGBgYAo+ID4gPiAkIHBlcmYgc3RhdCAtZSAn
Y3ljbGVzL3BlcmlvZD05OTk5OTk5OTk5OTk5OTk5OTk5OS8nIHRydWUKPiA+ID4gZXZlbnQgc3lu
dGF4IGVycm9yOiAnY3ljbGVzL3BlcmlvZD05OTk5OTk5OTk5OTk5OTk5OTk5OS8nCj4gPiA+ICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcX19fIHBhcnNlciBlcnJvcgo+ID4gPgo+
ID4KPiA+IFRoaXMgZW5kZWQgdXAgaW4gcGVyZi10b29scy1uZXh0LCB3aWxsIGhhdmUgdG8gbG9v
ayBhdCB3aGF0IHRoaXMgcHJvYmxlbQo+ID4gaXM6Cj4gPgo+ID4gICAgOSAgICAxMS40NiBhbWF6
b25saW51eDoyICAgICAgICAgICAgICAgICA6IEZBSUwgZ2NjIHZlcnNpb24gNy4zLjEgMjAxODA3
MTIgKFJlZCBIYXQgNy4zLjEtMTcpIChHQ0MpCj4gPiAgICAgIHl5X3NpemVfdCBwYXJzZV9ldmVu
dHNfZ2V0X2xlbmcgKHl5c2Nhbl90IHl5c2Nhbm5lciApOwo+ID4gICAgICAgICAgICAgICAgXn5+
fn5+fn5+fn5+fn5+fn5+fn5+Cj4gPiAgICAgdXRpbC9wYXJzZS1ldmVudHMubDoyMjo1OiBub3Rl
OiBwcmV2aW91cyBkZWNsYXJhdGlvbiBvZiAncGFyc2VfZXZlbnRzX2dldF9sZW5nJyB3YXMgaGVy
ZQo+ID4gICAgICBpbnQgcGFyc2VfZXZlbnRzX2dldF9sZW5nKHl5c2Nhbl90IHl5c2Nhbm5lcik7
Cj4gPiAgICAgICAgICBefn5+fn5+fn5+fn5+fn5+fn5+fn4KPiA+ICAgICAgeXlfc2l6ZV90IHBh
cnNlX2V2ZW50c19nZXRfbGVuZyAgKHl5c2Nhbl90IHl5c2Nhbm5lcikKPiA+ICAgICAgICAgICAg
ICAgIF5+fn5+fn5+fn5+fn5+fn5+fn5+fgo+ID4gICAgIHV0aWwvcGFyc2UtZXZlbnRzLmw6MjI6
NTogbm90ZTogcHJldmlvdXMgZGVjbGFyYXRpb24gb2YgJ3BhcnNlX2V2ZW50c19nZXRfbGVuZycg
d2FzIGhlcmUKPiA+ICAgICAgaW50IHBhcnNlX2V2ZW50c19nZXRfbGVuZyh5eXNjYW5fdCB5eXNj
YW5uZXIpOwo+ID4gICAgICAgICAgXn5+fn5+fn5+fn5+fn5+fn5+fn5+Cj4gPiAgICAgbWFrZVsz
XTogKioqIFt1dGlsXSBFcnJvciAyCj4gPgo+ID4KPiA+IFVuc3VyZSBpZiB0aGlzIHdpbGwgYXBw
ZWFyIG9uIHRoZSByYWRhciBvbiBvdGhlciBkaXN0cm9zLCBtYXliZSB0aGlzIGlzCj4gPiBqdXN0
IHNvbWV0aGluZyB0aGF0IHBvcHMgdXAgd2l0aCBvbGRlciBkaXN0cm9zLi4uCj4gPgo+ID4gUmFu
IG91dCBvZiB0aW1lIHRvZGF5Li4uCj4KPiBDb250ZXh0Ogo+Cj4gcGVyZmJ1aWxkZXJAbnVtYmVy
On4kIGV4cG9ydCBCVUlMRF9UQVJCQUxMPWh0dHA6Ly8xOTIuMTY4Ljg2LjQyL3BlcmYvcGVyZi02
LjkuMC1yYzUudGFyLnh6Cj4gcGVyZmJ1aWxkZXJAbnVtYmVyOn4kIHRpbWUgZG0KPiAgICAxICAg
MTAyLjMzIGFsbWFsaW51eDo4ICAgICAgICAgICAgICAgICAgIDogT2sgICBnY2MgKEdDQykgOC41
LjAgMjAyMTA1MTQgKFJlZCBIYXQgOC41LjAtMjApICwgY2xhbmcgdmVyc2lvbiAxNi4wLjYgKFJl
ZCBIYXQgMTYuMC42LTIubW9kdWxlX2VsOC45LjArMzYyMStkZjdmNzE0NikgZmxleCAyLjYuMQo+
ICAgIDIgICAxMDIuNDQgYWxtYWxpbnV4OjkgICAgICAgICAgICAgICAgICAgOiBPayAgIGdjYyAo
R0NDKSAxMS40LjEgMjAyMzA2MDUgKFJlZCBIYXQgMTEuNC4xLTIpICwgY2xhbmcgdmVyc2lvbiAx
Ni4wLjYgKFJlZCBIYXQgMTYuMC42LTEuZWw5KSBmbGV4IDIuNi40Cj4gICAgMyAgIDEyNC4zNCBh
bHBpbmU6My4xNSAgICAgICAgICAgICAgICAgICA6IE9rICAgZ2NjIChBbHBpbmUgMTAuMy4xX2dp
dDIwMjExMDI3KSAxMC4zLjEgMjAyMTEwMjcgLCBBbHBpbmUgY2xhbmcgdmVyc2lvbiAxMi4wLjEg
ZmxleCAyLjYuNAo+ICAgIDQgICAxMDkuNDIgYWxwaW5lOjMuMTYgICAgICAgICAgICAgICAgICAg
OiBPayAgIGdjYyAoQWxwaW5lIDExLjIuMV9naXQyMDIyMDIxOSkgMTEuMi4xIDIwMjIwMjE5ICwg
QWxwaW5lIGNsYW5nIHZlcnNpb24gMTMuMC4xIGZsZXggMi42LjQKPiAgICA1ICAgIDkwLjA4IGFs
cGluZTozLjE3ICAgICAgICAgICAgICAgICAgIDogT2sgICBnY2MgKEFscGluZSAxMi4yLjFfZ2l0
MjAyMjA5MjQtcjQpIDEyLjIuMSAyMDIyMDkyNCAsIEFscGluZSBjbGFuZyB2ZXJzaW9uIDE1LjAu
NyBmbGV4IDIuNi40Cj4gICAgNiAgICA4NC44NSBhbHBpbmU6My4xOCAgICAgICAgICAgICAgICAg
ICA6IE9rICAgZ2NjIChBbHBpbmUgMTIuMi4xX2dpdDIwMjIwOTI0LXIxMCkgMTIuMi4xIDIwMjIw
OTI0ICwgQWxwaW5lIGNsYW5nIHZlcnNpb24gMTYuMC42IGZsZXggMi42LjQKPiAgICA3ICAgIDk0
LjE4IGFscGluZTozLjE5ICAgICAgICAgICAgICAgICAgIDogT2sgICBnY2MgKEFscGluZSAxMy4y
LjFfZ2l0MjAyMzEwMTQpIDEzLjIuMSAyMDIzMTAxNCAsIEFscGluZSBjbGFuZyB2ZXJzaW9uIDE3
LjAuNSBmbGV4IDIuNi40Cj4gICAgOCAgICA5NS40NSBhbHBpbmU6ZWRnZSAgICAgICAgICAgICAg
ICAgICA6IE9rICAgZ2NjIChBbHBpbmUgMTMuMi4xX2dpdDIwMjQwMzA5KSAxMy4yLjEgMjAyNDAz
MDkgLCBBbHBpbmUgY2xhbmcgdmVyc2lvbiAxNy4wLjYgZmxleCAyLjYuNAo+ICAgIDkgICAgMTEu
NDYgYW1hem9ubGludXg6MiAgICAgICAgICAgICAgICAgOiBGQUlMIGdjYyB2ZXJzaW9uIDcuMy4x
IDIwMTgwNzEyIChSZWQgSGF0IDcuMy4xLTE3KSAoR0NDKQo+ICAgICAgeXlfc2l6ZV90IHBhcnNl
X2V2ZW50c19nZXRfbGVuZyAoeXlzY2FuX3QgeXlzY2FubmVyICk7Cj4gICAgICAgICAgICAgICAg
Xn5+fn5+fn5+fn5+fn5+fn5+fn5+Cj4gICAgIHV0aWwvcGFyc2UtZXZlbnRzLmw6MjI6NTogbm90
ZTogcHJldmlvdXMgZGVjbGFyYXRpb24gb2YgJ3BhcnNlX2V2ZW50c19nZXRfbGVuZycgd2FzIGhl
cmUKPiAgICAgIGludCBwYXJzZV9ldmVudHNfZ2V0X2xlbmcoeXlzY2FuX3QgeXlzY2FubmVyKTsK
PiAgICAgICAgICBefn5+fn5+fn5+fn5+fn5+fn5+fn4KPiAgICAgIHl5X3NpemVfdCBwYXJzZV9l
dmVudHNfZ2V0X2xlbmcgICh5eXNjYW5fdCB5eXNjYW5uZXIpCj4gICAgICAgICAgICAgICAgXn5+
fn5+fn5+fn5+fn5+fn5+fn5+Cj4gICAgIHV0aWwvcGFyc2UtZXZlbnRzLmw6MjI6NTogbm90ZTog
cHJldmlvdXMgZGVjbGFyYXRpb24gb2YgJ3BhcnNlX2V2ZW50c19nZXRfbGVuZycgd2FzIGhlcmUK
PiAgICAgIGludCBwYXJzZV9ldmVudHNfZ2V0X2xlbmcoeXlzY2FuX3QgeXlzY2FubmVyKTsKPiAg
ICAgICAgICBefn5+fn5+fn5+fn5+fn5+fn5+fn4KPiAgICAgbWFrZVszXTogKioqIFt1dGlsXSBF
cnJvciAyCj4gICAxMCAgICA4OC40MSBhbWF6b25saW51eDoyMDIzICAgICAgICAgICAgICA6IE9r
ICAgZ2NjIChHQ0MpIDExLjQuMSAyMDIzMDYwNSAoUmVkIEhhdCAxMS40LjEtMikgLCBjbGFuZyB2
ZXJzaW9uIDE1LjAuNyAoQW1hem9uIExpbnV4IDE1LjAuNy0zLmFtem4yMDIzLjAuMSkgZmxleCAy
LjYuNAo+ICAgMTEgICAgODkuNzIgYW1hem9ubGludXg6ZGV2ZWwgICAgICAgICAgICAgOiBPayAg
IGdjYyAoR0NDKSAxMS4zLjEgMjAyMjExMjEgKFJlZCBIYXQgMTEuMy4xLTQpICwgY2xhbmcgdmVy
c2lvbiAxNS4wLjYgKEFtYXpvbiBMaW51eCAxNS4wLjYtMy5hbXpuMjAyMy4wLjIpIGZsZXggMi42
LjQKPiAgIDEyICAgMTE1LjY1IGFyY2hsaW51eDpiYXNlICAgICAgICAgICAgICAgIDogT2sgICBn
Y2MgKEdDQykgMTMuMi4xIDIwMjMwODAxICwgY2xhbmcgdmVyc2lvbiAxNy4wLjYgZmxleCAyLjYu
NAo+ICAgMTMgICAgOTMuODcgY2VudG9zOnN0cmVhbSAgICAgICAgICAgICAgICAgOiBPayAgIGdj
YyAoR0NDKSA4LjUuMCAyMDIxMDUxNCAoUmVkIEhhdCA4LjUuMC0yMSkgLCBjbGFuZyB2ZXJzaW9u
IDE3LjAuNiAoUmVkIEhhdCAxNy4wLjYtMS5tb2R1bGVfZWw4Kzc2Nys5ZmE5NjZiOCkgZmxleCAy
LjYuMQoKRGlkIFJlZEhhdCBkbyB2YWx1ZSBhZGQgb24gZmxleCBvdXRwdXQ/IHl5Z2V0X2xlbmcg
aXMgZG9jdW1lbnRlZCB0bwpoYXZlIGFuIGludCByZXR1cm4gdHlwZToKaHR0cHM6Ly9naXRodWIu
Y29tL3dlc3Rlcy9mbGV4L2Jsb2IvbWFzdGVyL2RvYy9mbGV4LnRleGkjTDQ2MTMKVGhpcyBwYXRj
aCBqdXN0IGFkZHMgYSBmb3J3YXJkIGRlY2xhcmF0aW9uIGluIG9yZGVyIHRvIHVzZSBpdCBpbiBh
CmhlbHBlciBmdW5jdGlvbi4KClRoYW5rcywKSWFuCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlz
Y3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
