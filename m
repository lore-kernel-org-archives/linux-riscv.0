Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 940E0C38142
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Feb 2023 19:24:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cT+B6bapezUi6QORc+5Ka9ZCm9SCVewt7zjk/n/N9Uk=; b=4JCrieuJvzPTs/
	nfPuqf//2c/Kb+UMpnR70MSg3TkszMCoWqFPSXEYk6Fi29Kx8jaXL9zM0ycPFXMog5N9gupU8ZIZh
	9dxN6uNPeqZ4bZqWQ7iiNdRQR8UO1BTKnaXvcwpaPgYDZlJPS5Sp3pJx3j1Fe/jUHZgUme2CLtZac
	7idwF32wbmdxAUqoaT8WfFUUFZxLzJ6nwvpWjyz9/Fj/2EaY5vZHXLmj6f/h4R2SZhN1QYvBPsjRe
	YuNRN7u6zhzqtSHuUTgQqH9k/jw5IaUDedfY5/pfYsO9G+L38YsVaBxU+NGJlCjHeSKfK5ZmeYeQm
	1BoROvVPlxc+AAAeRGNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNIix-00DMUu-Fq; Wed, 01 Feb 2023 19:24:51 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNIit-00DMUN-Ok
	for linux-riscv@lists.infradead.org; Wed, 01 Feb 2023 19:24:49 +0000
Received: by mail-pf1-x431.google.com with SMTP id 144so13301001pfv.11
        for <linux-riscv@lists.infradead.org>; Wed, 01 Feb 2023 11:24:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/jfUP8j49LnH+0opcjK5BisED0hgZ9+/KVu7XGUypWk=;
        b=VgMNfl3OOmOnuYFV/FPcOrdEpU4BnAbiU9fTKyr0KZWauWrvblC6jJ4vCCQ6XVWJgv
         Mo34Ka+19P0n/mzjSRFWtpZIq5/Kbjo9c63HWZeClX4EPk/QZ9VpaXc+GKFpozsT+8OF
         jVVTeScbkfYT7cVAVfZ0wcQj1CIzSncPtUDyHAHNl557GxH4VacPIpcvFeIi2qatbYUa
         m6XxaBdUMPCp1cOHkbjDqL5AuQVrAWUTng34WItlqblIs5cD+BUTD0GMUAn6/S6x7orf
         9DhUDZg4D7MDOQc9ZPUQSLIdhJW/ZZBEZKCl/T1cbHYP7uN7QwrobRvyR5tu7rNkFZq1
         VYTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/jfUP8j49LnH+0opcjK5BisED0hgZ9+/KVu7XGUypWk=;
        b=xzLJpu1MAiPpiL18cHy8tXdJoZlBWUvdufvE7zvd+/IPAGlKS3HWSAdk23jukG7sh5
         VNbhbdwpCYTlObdEOXCeWRbAnxM9TAUYTsfRn36U8OHIeWmnNnvqrqo0VXwC1ijUMVIg
         R7iQd6I8CSSsxsD9soE8PyshPPXeYWwJrdsv4uGtr/ipvBLkMc4/ei2vX8mxjAoQPMSE
         Vga35VhiJRpfJv+IX/SsVu96Me4IBwmPLWRoriG9YVt9UyXaseZDWsZKtA3im72WMo1k
         kinM52YkxiBFpxazgBa2fLcByfCfmfcAjik3GQ/eOYvbTyeoKWBQISxM0iiG7qHHCy4P
         UAFA==
X-Gm-Message-State: AO0yUKXIUTU3qeeGNng1d+kZpBTLZePkwlF9DkwHWhqYH1LYFJWRK1uA
	4ZVXV4Y7D/uwf+4mGeZPRhUxdQ==
X-Google-Smtp-Source: AK7set97wbwaRJjHVc+esR+82RlJV0oLuRwadfZIr1Hm75Qx5+vq0Xs9AAP9Pt/1igkJ5mC9nzNQlQ==
X-Received: by 2002:a62:81c2:0:b0:58d:c728:6ee6 with SMTP id t185-20020a6281c2000000b0058dc7286ee6mr14017400pfd.34.1675279485493;
        Wed, 01 Feb 2023 11:24:45 -0800 (PST)
Received: from smtpclient.apple ([51.52.155.79])
        by smtp.gmail.com with ESMTPSA id z19-20020a056a001d9300b00581f76c1da1sm10782757pfw.191.2023.02.01.11.24.44
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 01 Feb 2023 11:24:45 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.120.41.1.1\))
Subject: Re: [PATCH] clocksource: riscv: Patch riscv_clock_next_event() jump
 before first use
From: Matt Evans <mev@rivosinc.com>
In-Reply-To: <Y9q7tj/jvQouqZ/K@spud>
Date: Wed, 1 Feb 2023 19:24:42 +0000
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 linux-riscv@lists.infradead.org
Message-Id: <BDE69C27-0B75-4072-A1FC-432755A895FB@rivosinc.com>
References: <512FC581-4097-4433-9C3D-CBCB7CD61954@rivosinc.com>
 <Y9q7tj/jvQouqZ/K@spud>
To: Conor Dooley <conor@kernel.org>
X-Mailer: Apple Mail (2.3696.120.41.1.1)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230201_112447_823687_17DBEDF6 
X-CRM114-Status: GOOD (  18.79  )
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

SGkgQ29ub3IsCgo+IE9uIDEgRmViIDIwMjMsIGF0IDE5OjIxLCBDb25vciBEb29sZXkgPGNvbm9y
QGtlcm5lbC5vcmc+IHdyb3RlOgo+IAo+IEhleSBNYXR0LAo+IAo+IE9uIFdlZCwgRmViIDAxLCAy
MDIzIGF0IDA2OjQxOjUyUE0gKzAwMDAsIE1hdHQgRXZhbnMgd3JvdGU6Cj4+IEEgc3RhdGljIGtl
eSBpcyB1c2VkIHRvIHNlbGVjdCBiZXR3ZWVuIFNCSSBhbmQgU3N0YyB0aW1lciB1c2FnZSBpbgo+
PiByaXNjdl9jbG9ja19uZXh0X2V2ZW50KCksIGJ1dCBjdXJyZW50bHkgdGhlIGRpcmVjdGlvbiBp
cyByZXNvbHZlZAo+PiBhZnRlciBjcHVocF9zZXR1cF9zdGF0ZSgpIGlzIGNhbGxlZCAod2hpY2gg
c2V0cyB0aGUgbmV4dCBldmVudCkuICBUaGUKPj4gZmlyc3QgZXZlbnQgd2lsbCB0aGVyZWZvcmUg
ZmFsbCB0aHJvdWdoIHRoZSBzYmlfc2V0X3RpbWVyKCkgcGF0aDsgdGhpcwo+PiBicmVha3MgU3N0
Yy1vbmx5IHN5c3RlbXMuICBTbywgYXBwbHkgdGhlIGp1bXAgcGF0Y2hpbmcgYmVmb3JlIGZpcnN0
Cj4+IHVzZS4KPj4gCj4+IFNpZ25lZC1vZmYtYnk6IE1hdHQgRXZhbnMgPG1ldkByaXZvc2luYy5j
b20+Cj4gCj4gWW91ciBsb2dpYyBpbiB0aGlzIHBhdGNoIGxvb2tzIGdyYW5kLCBqdXN0IGdvdCB0
d28gcHJvY2VzcyBiaXRzIGZvciB5YS4KPiBGaXJzdGx5LCB5b3UncmUgbWlzc2luZyBhIGZpeGVz
IHRhZywgd2hpY2ggSSB3b3VsZCBpbWFnaW5lIGlzOgo+IEZpeGVzOiA5ZjdhOGZmNjM5MWYgKCJS
SVNDLVY6IFByZWZlciBzc3RjIGV4dGVuc2lvbiBpZiBhdmFpbGFibGUiKQo+IAo+IEFsc28sIG9m
IGxhdGUsIHRoZSBjbG9ja3NvdXJjZSBtYWludGFpbmVycywgd2hvIHlvdSBoYXZlIG5vdCBDQ2Vk
LAo+IGhhdmUgYmVlbiB0aGUgb25lcyB0aGF0IHBpY2sgdXAgcGF0Y2hlcyB0aGF0IG9ubHkgdG91
Y2ggdGhpcyBkcml2ZXIuCj4gTWlnaHQgYmUgd29ydGggYSByZXN1Ym1pc3Npb24gQ0NpbmcgdGhl
bS4uLgoKQm90aCBnb29kIHBvaW50cywgbWFueSB0aGFua3MuICBUcnVlLCBpdCBmaXhlcyg6KSA5
ZjdhOGZmNjM5MWYsIGFuZCBUSUwgb24gdGhlIHNoZXBoZXJkIGNoYWluLiAgSeKAmWxsIHJlLXNl
bmQuCgoKQ2hlZXJzLAoKCk1hdHQKCj4gCj4gQ2hlZXJzLAo+IENvbm9yLgo+IAo+PiAtLS0KPj4g
ZHJpdmVycy9jbG9ja3NvdXJjZS90aW1lci1yaXNjdi5jIHwgMTAgKysrKystLS0tLQo+PiAxIGZp
bGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQo+PiAKPj4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvY2xvY2tzb3VyY2UvdGltZXItcmlzY3YuYyBiL2RyaXZlcnMvY2xvY2tz
b3VyY2UvdGltZXItcmlzY3YuYwo+PiBpbmRleCA5NjlhNTUyZGE4ZDIuLmEzNmQxNzNmZDZjZCAx
MDA2NDQKPj4gLS0tIGEvZHJpdmVycy9jbG9ja3NvdXJjZS90aW1lci1yaXNjdi5jCj4+ICsrKyBi
L2RyaXZlcnMvY2xvY2tzb3VyY2UvdGltZXItcmlzY3YuYwo+PiBAQCAtMTc3LDYgKzE3NywxMSBA
QCBzdGF0aWMgaW50IF9faW5pdCByaXNjdl90aW1lcl9pbml0X2R0KHN0cnVjdCBkZXZpY2Vfbm9k
ZSAqbikKPj4gCQlyZXR1cm4gZXJyb3I7Cj4+IAl9Cj4+IAo+PiArCWlmIChyaXNjdl9pc2FfZXh0
ZW5zaW9uX2F2YWlsYWJsZShOVUxMLCBTU1RDKSkgewo+PiArCQlwcl9pbmZvKCJUaW1lciBpbnRl
cnJ1cHQgaW4gUy1tb2RlIGlzIGF2YWlsYWJsZSB2aWEgc3N0YyBleHRlbnNpb25cbiIpOwo+PiAr
CQlzdGF0aWNfYnJhbmNoX2VuYWJsZSgmcmlzY3Zfc3N0Y19hdmFpbGFibGUpOwo+PiArCX0KPj4g
Kwo+PiAJZXJyb3IgPSBjcHVocF9zZXR1cF9zdGF0ZShDUFVIUF9BUF9SSVNDVl9USU1FUl9TVEFS
VElORywKPj4gCQkJICJjbG9ja2V2ZW50cy9yaXNjdi90aW1lcjpzdGFydGluZyIsCj4+IAkJCSBy
aXNjdl90aW1lcl9zdGFydGluZ19jcHUsIHJpc2N2X3RpbWVyX2R5aW5nX2NwdSk7Cj4+IEBAIC0x
ODQsMTEgKzE4OSw2IEBAIHN0YXRpYyBpbnQgX19pbml0IHJpc2N2X3RpbWVyX2luaXRfZHQoc3Ry
dWN0IGRldmljZV9ub2RlICpuKQo+PiAJCXByX2VycigiY3B1IGhwIHNldHVwIHN0YXRlIGZhaWxl
ZCBmb3IgUklTQ1YgdGltZXIgWyVkXVxuIiwKPj4gCQkgICAgICAgZXJyb3IpOwo+PiAKPj4gLQlp
ZiAocmlzY3ZfaXNhX2V4dGVuc2lvbl9hdmFpbGFibGUoTlVMTCwgU1NUQykpIHsKPj4gLQkJcHJf
aW5mbygiVGltZXIgaW50ZXJydXB0IGluIFMtbW9kZSBpcyBhdmFpbGFibGUgdmlhIHNzdGMgZXh0
ZW5zaW9uXG4iKTsKPj4gLQkJc3RhdGljX2JyYW5jaF9lbmFibGUoJnJpc2N2X3NzdGNfYXZhaWxh
YmxlKTsKPj4gLQl9Cj4+IC0KPj4gCXJldHVybiBlcnJvcjsKPj4gfQo+PiAKPj4gLS0gCj4+IDIu
MzAuMgo+PiAKPj4gCj4+IAo+PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwo+PiBsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKPj4gbGludXgtcmlzY3ZAbGlz
dHMuaW5mcmFkZWFkLm9yZwo+PiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXJpc2N2CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1yaXNjdgo=
