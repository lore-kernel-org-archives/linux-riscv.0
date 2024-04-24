Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71ECBC4345F
	for <linux-riscv@archiver.kernel.org>; Wed, 24 Apr 2024 00:28:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=B/AtNbnzr24es/5zflWQrPiaQFiINrZrChQX5JMWQFs=; b=T5QAZi25NyrjbB
	7RScLF/4+mgQFqq8NSpwLlxdyUnIMOVpohRsv5/ebrhHyLOIzTAJnOXFxOkiqhValmskICB9SyjCP
	sEO3MiIalB7HP+mxOV/qvqzoUCMc0AVUlbvQN/HQEpBBpZzx53afchOoM0GlFzJevD9lveHMObx2Y
	GVEdBDULDfj4CDhnENDwwqYoJD9hT9plDrJFUsJ49Al4bvN7SUxTWPvbR+Ak3XapYageVbG6kFPgd
	nRRT9nWKGYr9AtZVaOZZOeyacTlIRyjMeGznygfQe74a15S2BBy2mEcTWVsE5h/a5fFrG7td47xA5
	6PPg9iGMdC8886AyYR0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzQUj-00000001xj1-2FOn;
	Wed, 24 Apr 2024 00:28:17 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzQUf-00000001xiB-44Av
	for linux-riscv@lists.infradead.org;
	Wed, 24 Apr 2024 00:28:15 +0000
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-516d2b9cd69so7723602e87.2
        for <linux-riscv@lists.infradead.org>; Tue, 23 Apr 2024 17:28:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1713918491; x=1714523291; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GXU+ikToE9vTgd0d2ogVMdIIk0usIDCY3palNyF75i4=;
        b=gnBOQwwsoqUYur/ZahN7zLzeXlSyaG7QMrmpZ3CEBIBDnQ7WZusyxUbRcqEIGsfBRy
         vQEysmstT/iuHazIs6UI9ptv1SUxTEbRhLKvWZiQ4InA8eDc03DU12E757FYEY5S0Acc
         Q0pMlRsxto+y5JTej6iSJYYAUi08bsNeCVwHPgzme7iM1MI5SaeB+JwyPlT6GRcT1asW
         0bgZJzSX7kVLwB4LAUAQEShL7EFmpwgR4VDbFTAjwvAhP51MGBnr2UgNiCINwOqLD1bu
         HS9AkgZEJYaGFS344HVwxNL0wsD7VKAzXqLy8Zoy2KMy2cXqXIN0UAFW0dOXToicejvy
         7Ucg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713918491; x=1714523291;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GXU+ikToE9vTgd0d2ogVMdIIk0usIDCY3palNyF75i4=;
        b=KRK3GIPHzfj0saviugQt1UPqzmY0AED5FwlbGC8E0NbuL8Tcy342N7JnXVqODWDdjd
         QNzd2tf280CMPbPo/M2tul4IasU7soIFLYw+CVWbmDhbjuKp4HHWc/9P72X8b7SCOnkm
         rOO1PN5THnwELW1DNdouUAAatP8aqfBk9HY3u63CP6w0hvbxIhkSLG6nZtN639Gq0gAV
         QgPhi/zm4d+FajR4HrTvbXF+jOoOEOlmu0xjs936HqW+S46oeDV5lmC3HWszImuVLs2/
         tVqBPup5VWg6JYxjP36gefTKj5LKr8J2rs60nbyhB1DKgUQlFuQpobuUS947v3Ne18ik
         znjA==
X-Forwarded-Encrypted: i=1; AJvYcCUTD/uPopi0Ubkks+TeVlmfQOuLfDi1zLp0SRV0jRw7O9Dkzjly8wZLvUKrxdyCep4KSY+YJEbQHb4tQqjFSEWC7NLvqyBVIpINytKMkPI3
X-Gm-Message-State: AOJu0Yw8Zzl4IX8JJvg8zGHd3MOSAabHEyBqBZnz3D2INi11LkcakL8J
	85Squq0kN4tPheKpy1VCeTtyIxjzcfbWMIz8xEdCS4MFOHRZ0+8SXhMWVp+vk8c+YWzFJScgXEI
	nwECpRe2erW1+9llqYcStLzgGS3rU5u+JW3DpgA==
X-Google-Smtp-Source: AGHT+IFmAtveWqF5KaXct/eDRNhEoPLTdbLM1bttvHvTHWx51gYkcxlUgQIhdEx7nF7tg8XpB0fvpPToj5um1tKlVE0=
X-Received: by 2002:a19:914d:0:b0:516:c696:9078 with SMTP id
 y13-20020a19914d000000b00516c6969078mr607660lfj.50.1713918491483; Tue, 23 Apr
 2024 17:28:11 -0700 (PDT)
MIME-Version: 1.0
References: <20240416061533.921723-1-irogers@google.com>
In-Reply-To: <20240416061533.921723-1-irogers@google.com>
From: Atish Kumar Patra <atishp@rivosinc.com>
Date: Tue, 23 Apr 2024 17:28:00 -0700
Message-ID: <CAHBxVyF-u__MY9BNkqxUJg4ra76CzT0p_JBVaQqZm=u4V4u5AQ@mail.gmail.com>
Subject: Re: [PATCH v2 00/16] Consistently prefer sysfs/json events
To: Ian Rogers <irogers@google.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, Kan Liang <kan.liang@linux.intel.com>, 
	James Clark <james.clark@arm.com>, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org, bpf@vger.kernel.org, 
	linux-riscv@lists.infradead.org, Beeman Strong <beeman@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240423_172814_144986_F823EBEB 
X-CRM114-Status: GOOD (  16.72  )
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

T24gTW9uLCBBcHIgMTUsIDIwMjQgYXQgMTE6MTXigK9QTSBJYW4gUm9nZXJzIDxpcm9nZXJzQGdv
b2dsZS5jb20+IHdyb3RlOgo+Cj4gQXMgZGlzY3Vzc2VkIGluOgo+IGh0dHBzOi8vbG9yZS5rZXJu
ZWwub3JnL2xrbWwvMjAyNDAyMTcwMDU3MzguMzc0NDEyMS0xLWF0aXNocEByaXZvc2luYy5jb20v
Cj4gcHJlZmVycmluZyBzeXNmcy9qc29uIGV2ZW50cyBjb25zaXN0ZW50bHkgKHdpdGggb3Igd2l0
aG91dCBhIGdpdmVuCj4gUE1VKSB3aWxsIGVuYWJsZSBSSVNDLVYncyBob3BlIHRvIGN1c3RvbWl6
ZSBsZWdhY3kgZXZlbnRzIGluIHRoZSBwZXJmCj4gdG9vbC4KPgoKVGhhbmtzIGZvciByZW1hcHBp
bmcgbGVnYWN5IGV2ZW50cyBpbiBhIGdlbmVyaWMgd2F5LiBUaGlzIGxvb2tzIGdyZWF0CmFuZCBn
b3QgcmlkIG9mIG15CnVnbHkgYXJjaCBzcGVjaWZpYyB3YXkgb2YgcmVtYXBwaW5nLiAgSXMgdGhl
cmUgYSBnb29kIHdheSBmb3IgdGhlCmRyaXZlciAoZS5nIHZpYSBzeXNmcykgdG8gdGVsbCB0aGUg
cGVyZiB0b29sCndoZXRoZXIgdG8gcmVtYXAgdGhlIGxlZ2FjeSBldmVudCBvciBub3QgPwoKSW4g
UklTQy1WIHRoZSBsZWdhY3kgc3lzdGVtcyB3aXRob3V0IHRoZSBuZXcgSVNBIGV4dGVuc2lvbiBt
YXkgbm90CndhbnQgdG8gcmVtYXAgaWYgcnVubmluZwp0aGUgbGF0ZXN0IGtlcm5lbC4KCkkgZGVz
Y3JpYmVkIHRoZSBwcm9ibGVtIGluIGRldGFpbCBpbiB0aGUgb3JpZ2luYWwgdGhyZWFkIGFzIHdl
bGwuCmh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xrbWwvNjNkNzNmMDktODRlNS00OWUxLTk5ZjUt
NjBmNDE0YjIyZDcwQHJpdm9zaW5jLmNvbS8KCkZXSVcsIGZvciB0aGUgZW50aXJlIHNlcmllcy4K
VGVzdGVkLWJ5OiBBdGlzaCBQYXRyYSA8YXRpc2hwQHJpdm9zaW5jLmNvbT4KCj4gU29tZSBtaW5v
ciBjbGVhbi11cCBpcyBwZXJmb3JtZWQgb24gdGhlIHdheS4KPgo+IHYyLiBBZGRpdGlvbmFsIGNs
ZWFudXAgcGFydGljdWxhcmx5IGFkZGluZyBiZXR0ZXIgZXJyb3IgbWVzc2FnZXMuIEZpeAo+ICAg
ICBzb21lIGxpbmUgbGVuZ3RoIGlzc3VlcyBvbiB0aGUgZWFybGllciBwYXRjaGVzLgo+Cj4gSWFu
IFJvZ2VycyAoMTYpOgo+ICAgcGVyZiBwYXJzZS1ldmVudHM6IEZhY3RvciBvdXQgJzxldmVudF9v
cl9wbXU+Ly4uLi8nIHBhcnNpbmcKPiAgIHBlcmYgcGFyc2UtZXZlbnRzOiBEaXJlY3RseSBwYXNz
IFBNVSB0byBwYXJzZV9ldmVudHNfYWRkX3BtdQo+ICAgcGVyZiBwYXJzZS1ldmVudHM6IEF2b2lk
IGNvcHlpbmcgYW4gZW1wdHkgbGlzdAo+ICAgcGVyZiBwbXU6IFJlZmFjdG9yIHBlcmZfcG11X19t
YXRjaAo+ICAgcGVyZiB0ZXN0cyBwYXJzZS1ldmVudHM6IFVzZSBicmFuY2hlcyByYXRoZXIgdGhh
biBjYWNoZS1yZWZlcmVuY2VzCj4gICBwZXJmIHBhcnNlLWV2ZW50czogTGVnYWN5IGNhY2hlIG5h
bWVzIG9uIGFsbCBQTVVzIGFuZCBsb3dlciBwcmlvcml0eQo+ICAgcGVyZiBwYXJzZS1ldmVudHM6
IEhhbmRsZSBQRV9URVJNX0hXIGluIG5hbWVfb3JfcmF3Cj4gICBwZXJmIHBhcnNlLWV2ZW50czog
Q29uc3RpZnkgcGFyc2VfZXZlbnRzX2FkZF9udW1lcmljCj4gICBwZXJmIHBhcnNlLWV2ZW50czog
UHJlZmVyIHN5c2ZzL2pzb24gaGFyZHdhcmUgZXZlbnRzIG92ZXIgbGVnYWN5Cj4gICBwZXJmIHBh
cnNlLWV2ZW50czogSW5saW5lIHBhcnNlX2V2ZW50c191cGRhdGVfbGlzdHMKPiAgIHBlcmYgcGFy
c2UtZXZlbnRzOiBJbXByb3ZlIGVycm9yIG1lc3NhZ2UgZm9yIGJhZCBudW1iZXJzCj4gICBwZXJm
IHBhcnNlLWV2ZW50czogSW5saW5lIHBhcnNlX2V2ZW50c19ldmxpc3RfZXJyb3IKPiAgIHBlcmYg
cGFyc2UtZXZlbnRzOiBJbXByb3ZlbWVudHMgdG8gbW9kaWZpZXIgcGFyc2luZwo+ICAgcGVyZiBw
YXJzZS1ldmVudDogQ29uc3RpZnkgZXZlbnRfc3ltYm9sIGFycmF5cwo+ICAgcGVyZiBwYXJzZS1l
dmVudHM6IE1pbm9yIGdyb3VwaW5nIHRpZHkgdXAKPiAgIHBlcmYgcGFyc2UtZXZlbnRzOiBUaWR5
IHRoZSBzZXR0aW5nIG9mIHRoZSBkZWZhdWx0IGV2ZW50IG5hbWUKPgo+ICB0b29scy9wZXJmL3Rl
c3RzL3BhcnNlLWV2ZW50cy5jIHwgICA2ICstCj4gIHRvb2xzL3BlcmYvdXRpbC9wYXJzZS1ldmVu
dHMuYyAgfCA0ODIgKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0KPiAgdG9vbHMvcGVy
Zi91dGlsL3BhcnNlLWV2ZW50cy5oICB8ICA0OSArKy0tCj4gIHRvb2xzL3BlcmYvdXRpbC9wYXJz
ZS1ldmVudHMubCAgfCAxOTYgKysrKysrKysrLS0tLQo+ICB0b29scy9wZXJmL3V0aWwvcGFyc2Ut
ZXZlbnRzLnkgIHwgMjYxICsrKysrKystLS0tLS0tLS0tCj4gIHRvb2xzL3BlcmYvdXRpbC9wbXUu
YyAgICAgICAgICAgfCAgMjcgKy0KPiAgdG9vbHMvcGVyZi91dGlsL3BtdS5oICAgICAgICAgICB8
ICAgMiArLQo+ICA3IGZpbGVzIGNoYW5nZWQsIDU0MCBpbnNlcnRpb25zKCspLCA0ODMgZGVsZXRp
b25zKC0pCj4KPiAtLQo+IDIuNDQuMC42ODMuZzc5NjFjODM4YWMtZ29vZwo+CgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5n
IGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
