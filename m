Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BA5EF8DFCC
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Apr 2026 21:32:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xukkMRA9ZT9+IQauwJwBEPtjlpIoRZr6QxpP3/horHs=; b=CVfTgDmu4SJiRP
	/mXicFtDZK3jFHWwYPUzxxrmh9eDavdo1caqmEZgjA9llmb3u7VuHPngIGi3AmKfxtmh7kN2D4mvO
	ppJ2JY6GOIGD7zNbG5QQ0gxQRagJk+OO7SzagELECkExjmo/tBKFibsRSsGZLKiv/ZEUFkZ2jtrNc
	Dh/qd7K9Tv6bmBzWyqGXc6TP0RMxpnMclrxslSqaeFV5eoe8yARMP68k+LYAlhjSHc6/fbbFp2Js2
	RPVjCj4MFrRTaZ+qEr/uVKtzDv8cEOCIdHF30625STILUdVH1CJCScJoAyFNZ4kJYxchmS4Mxp+qG
	e3e4DyO0V22BswJ6yErw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDUJj-000000035XZ-23oO;
	Thu, 16 Apr 2026 21:32:07 +0000
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDUJh-000000035XC-1VXB;
	Thu, 16 Apr 2026 21:32:05 +0000
Message-ID: <c325d85e-98d2-4e35-b7e7-7bb4d6ee77aa@infradead.org>
Date: Thu, 16 Apr 2026 14:32:04 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/8] Auto-generate maintainer profile entries
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Albert Ou <aou@eecs.berkeley.edu>, Jonathan Corbet <corbet@lwn.net>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, workflows@vger.kernel.org,
 Alexandre Ghiti <alex@ghiti.fr>, Shuah Khan <skhan@linuxfoundation.org>,
 Dan Williams <djbw@kernel.org>
References: <cover.1776242739.git.mchehab+huawei@kernel.org>
 <88335220-3527-4b1f-9500-417f7ebb7a02@infradead.org>
 <20260416100026.3df67a72@foz.lan>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20260416100026.3df67a72@foz.lan>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org



On 4/16/26 1:00 AM, Mauro Carvalho Chehab wrote:
> On Wed, 15 Apr 2026 13:41:16 -0700
> Randy Dunlap <rdunlap@infradead.org> wrote:
> 
>> Hi Mauro,
>>
>> Thanks for tackling this issue.
>>
>> On 4/15/26 1:52 AM, Mauro Carvalho Chehab wrote:
>>> Date: Tue, 14 Apr 2026 16:29:03 +0200
>>> From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
>>> To: Albert Ou <aou@eecs.berkeley.edu>, Jonathan Corbet <corbet@lwn.net>, Dan Williams <djbw@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>
>>> Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, Randy Dunlap <rdunlap@infradead.org>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, workflows@vger.kernel.org, Alexandre Ghiti <alex@ghiti.fr>, Shuah Khan <skhan@linuxfoundation.org>
>>> Message-ID: <cover.1776176108.git.mchehab+huawei@kernel.org>
>>>
>>> Hi Dan/Jon,
>>>
>>> This patch series change the way maintainer entry profile links
>>> are added to the documentation. Instead of having an entry for
>>> each of them at an ReST file, get them from MAINTAINERS content.
>>>
>>> That should likely make easier to maintain, as there will be a single
>>> point to place all such profiles.
>>>
>>> On this version, I added Dan's text to patch 4.
>>>
>>> I also added a couple of other patches to improve its output. While
>>> I could have them merged at the first patch, I opted to make them
>>> separate, as, in case of problems or needed changes, it would be
>>> easier to revert or modify the corresponding logic. Also, it should
>>> be better to review, in case one wants some changes there.
>>>
>>> The main changes against RFC are:
>>>
>>> - now, the TOC will be presented with 1 depth identation level,
>>>   meaning that it would look like a list;
>>> - for files outside Documentation/process, it will use the name of
>>>   the subsystem with title capitalization for the name of the
>>>   profile entry;
>>> - the logic also parses and produces a list of profiles that are
>>>   maintained elsewhere, picking its http/https link;
>>> - entries are now better sorted: first by subsystem name, then
>>>   by its name.
>>>
>>> Suggested-by: Dan Williams <djbw@kernel.org>
>>> Closes: https://lore.kernel.org/linux-doc/69dd6299440be_147c801005b@djbw-dev.notmuch/
>>>
>>> Mauro Carvalho Chehab (8):
>>>   docs: maintainers_include: auto-generate maintainer profile TOC
>>>   MAINTAINERS: add an entry for media maintainers profile
>>>   MAINTAINERS: add maintainer-tip.rst to X86
>>>   docs: auto-generate maintainer entry profile links
>>>   docs: maintainers_include: use a better title for profiles
>>>   docs: maintainers_include: add external profile URLs
>>>   docs: maintainers_include: preserve names for files under process/
>>>   docs: maintainers_include: Only show main entry for profiles
>>>
>>>  .../maintainer/maintainer-entry-profile.rst   |  24 +---
>>>  .../process/maintainer-handbooks.rst          |  17 ++-
>>>  Documentation/sphinx/maintainers_include.py   | 131 +++++++++++++++---
>>>  MAINTAINERS                                   |   2 +
>>>  4 files changed, 128 insertions(+), 46 deletions(-)  
>>
>> When building htmldocs with O=DOCS, I get a bunch of warnings.
>> I tested against today's linux-next tree.
>>
>> The 'make O=DOCS htmldocs' warnings are (subset of all warnings):
>>
>> linux-next/MAINTAINERS:38: WARNING: toctree contains reference to nonexisting document 'DOCS/Documentation/process/maintainer-kvm-x86' [toc.not_readable]
>> linux-next/MAINTAINERS:38: WARNING: toctree contains reference to nonexisting document 'DOCS/Documentation/filesystems/xfs/xfs-maintainer-entry-profile' [toc.not_readable]
>> linux-next/MAINTAINERS:38: WARNING: toctree contains reference to nonexisting document 'DOCS/Documentation/process/maintainer-soc-clean-dts' [toc.not_readable]
>> linux-next/MAINTAINERS:38: WARNING: toctree contains reference to nonexisting document 'DOCS/Documentation/process/maintainer-netdev' [toc.not_readable]
>> linux-next/MAINTAINERS:38: WARNING: toctree contains reference to nonexisting document 'DOCS/Documentation/process/maintainer-tip' [toc.not_readable]
>>
>> linux-next/Documentation/filesystems/nfs/nfsd-maintainer-entry-profile.rst: WARNING: document isn't included in any toctree [toc.not_included]
>> linux-next/Documentation/process/maintainer-kvm-x86.rst: WARNING: document isn't included in any toctree [toc.not_included]
>> linux-next/Documentation/process/maintainer-netdev.rst: WARNING: document isn't included in any toctree [toc.not_included]
>> linux-next/Documentation/process/maintainer-soc.rst: WARNING: document isn't included in any toctree [toc.not_included]
>> linux-next/Documentation/process/maintainer-soc-clean-dts.rst: WARNING: document isn't included in any toctree [toc.not_included]
>> linux-next/Documentation/process/maintainer-tip.rst: WARNING: document isn't included in any toctree [toc.not_included]
>>
>> linux-next/MAINTAINERS:1: WARNING: unknown document: '../../DOCS/Documentation/process/maintainer-soc' [ref.doc]
>> linux-next/MAINTAINERS:2: WARNING: unknown document: '../../DOCS/Documentation/process/maintainer-soc-clean-dts' [ref.doc]
>> linux-next/MAINTAINERS:3: WARNING: unknown document: '../../DOCS/Documentation/process/maintainer-soc-clean-dts' [ref.doc]
>> linux-next/MAINTAINERS:5: WARNING: unknown document: '../../DOCS/Documentation/process/maintainer-tip' [ref.doc]
>> linux-next/MAINTAINERS:6: WARNING: unknown document: '../../DOCS/Documentation/process/maintainer-tip' [ref.doc]
> 
> Heh, os.path.relpath() does the wrong thing here.
> 
> The enclosed patch should handle it better.
> 
> Thanks,
> Mauro
> 
> [PATCH] docs: maintainers_include: fix support for O=dir
> 
> os.path.relpath() will do the wrong thing with O=dir, as the build
> system uses "cd <dir>" internally.
> 
> Solve it by using app.srcdir, which, on normal cases, point to
> Documentation/, or, when SPHINXDIRS=process, it will be set with
> Documentation/process.
> 
> While here, remove a dead code while writing maintainer profiles,
> as now all entries should have both profile and entry.
> 
> Reported-by: Randy Dunlap <rdunlap@infradead.org>
> Closes: https://lore.kernel.org/linux-doc/88335220-3527-4b1f-9500-417f7ebb7a02@infradead.org/T/#m6854cbd8d30e2c5d3e8c4173bae1c3d6922ff970
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> 
> diff --git a/Documentation/sphinx/maintainers_include.py b/Documentation/sphinx/maintainers_include.py
> index 5413c1350bba..fff9bdd55a56 100755
> --- a/Documentation/sphinx/maintainers_include.py
> +++ b/Documentation/sphinx/maintainers_include.py
> @@ -27,15 +27,24 @@ from docutils import statemachine
>  from docutils.parsers.rst import Directive
>  from docutils.parsers.rst.directives.misc import Include
>  
> +#
> +# Base URL for intersphinx-like links to maintainer profiles
> +#
> +KERNELDOC_URL = "https://docs.kernel.org/"
> +
>  def ErrorString(exc):  # Shamelessly stolen from docutils
>      return f'{exc.__class__.__name}: {exc}'
>  
>  __version__  = '1.0'
>  
> +base_dir = "."
> +
>  class MaintainersParser:
>      """Parse MAINTAINERS file(s) content"""
>  
> -    def __init__(self, base_path, path):
> +    def __init__(self, path):
> +        global base_dir
> +
>          self.profile_toc = set()
>          self.profile_entries = {}
>  
> @@ -76,9 +85,18 @@ class MaintainersParser:
>              #
>              # Handle profile entries - either as files or as https refs
>              #
> -            match = re.match(r"P:\s*(Documentation/\S+)\.rst", line)
> +            match = re.match(r"P:\s*Documentation(/\S+)\.rst", line)
>              if match:
> -                entry = os.path.relpath(match.group(1), base_path)
> +                entry = os.path.relpath(match.group(1), base_dir)
> +
> +                #
> +                # When SPHINXDIRS is used, it will try to reference files
> +                # outside srctree, causing warnings. To avoid that, point
> +                # to the latest official documentation
> +                #
> +                if entry.startswith("../"):
> +                    entry = KERNELDOC_URL + match.group(1) + ".html"
> +
>                  if "*" in entry:
>                      for e in glob(entry):
>                          self.profile_toc.add(e)
> @@ -189,10 +207,10 @@ class MaintainersInclude(Include):
>      """MaintainersInclude (``maintainers-include``) directive"""
>      required_arguments = 0
>  
> -    def emit(self, base_path, path):
> +    def emit(self, path):
>          """Parse all the MAINTAINERS lines into ReST for human-readability"""
>  
> -        output = MaintainersParser(base_path, path).output
> +        output = MaintainersParser(path).output
>  
>          # For debugging the pre-rendered results...
>          #print(output, file=open("/tmp/MAINTAINERS.rst", "w"))
> @@ -213,11 +231,10 @@ class MaintainersInclude(Include):
>  
>          # Append "MAINTAINERS"
>          path = os.path.join(path, "MAINTAINERS")
> -        base_path = os.path.dirname(self.state.document.document.current_source)
>  
>          try:
>              self.state.document.settings.record_dependencies.add(path)
> -            lines = self.emit(base_path, path)
> +            lines = self.emit(path)
>          except IOError as error:
>              raise self.severe('Problems with "%s" directive path:\n%s.' %
>                        (self.name, ErrorString(error)))
> @@ -227,27 +244,20 @@ class MaintainersInclude(Include):
>  class MaintainersProfile(Include):
>      required_arguments = 0
>  
> -    def emit(self, base_path, path):
> +    def emit(self, path):
>          """Parse all the MAINTAINERS lines looking for profile entries"""
>  
> -        maint = MaintainersParser(base_path, path)
> +        maint = MaintainersParser(path)
>  
>          #
>          # Produce a list with all maintainer profiles, sorted by subsystem name
>          #
>          output = ""
> -
> -        for profile, entry in maint.profile_entries.items():
> +        for profile, entry in sorted(maint.profile_entries.items()):
>              if entry.startswith("http"):
> -                if profile:
> -                    output += f"- `{profile} <{entry}>`_\n"
> -                else:
> -                    output += f"- `<{entry}>_`\n"
> +                output += f"- `{profile} <{entry}>`_\n"
>              else:
> -                if profile:
> -                    output += f"- :doc:`{profile} <{entry}>`\n"
> -                else:
> -                    output += f"- :doc:`<{entry}>`\n"
> +                output += f"- :doc:`{profile} <{entry}>`\n"
>  
>          #
>          # Create a hidden TOC table with all profiles. That allows adding
> @@ -277,11 +287,10 @@ class MaintainersProfile(Include):
>  
>          # Append "MAINTAINERS"
>          path = os.path.join(path, "MAINTAINERS")
> -        base_path = os.path.dirname(self.state.document.document.current_source)
>  
>          try:
>              self.state.document.settings.record_dependencies.add(path)
> -            lines = self.emit(base_path, path)
> +            lines = self.emit(path)
>          except IOError as error:
>              raise self.severe('Problems with "%s" directive path:\n%s.' %
>                        (self.name, ErrorString(error)))
> @@ -289,6 +298,15 @@ class MaintainersProfile(Include):
>          return []
>  
>  def setup(app):
> +    global base_dir
> +
> +    #
> +    # partition will pick the path after Documentation.
> +    # NOTE: we're using os.fspath() here because of a Sphinx warning:
> +    #   RemovedInSphinx90Warning: Sphinx 9 will drop support for representing paths as strings. Use "pathlib.Path" or "os.fspath" instead.
> +    #
> +    _, _, base_dir = os.fspath(app.srcdir).partition("Documentation")
> +
>      app.add_directive("maintainers-include", MaintainersInclude)
>      app.add_directive("maintainers-profile-toc", MaintainersProfile)
>      return dict(

With that patch I still see 6 warnings:

linux-next/Documentation/filesystems/nfs/nfsd-maintainer-entry-profile.rst: WARNING: document isn't included in any toctree [toc.not_included]
linux-next/Documentation/process/maintainer-kvm-x86.rst: WARNING: document isn't included in any toctree [toc.not_included]
linux-next/Documentation/process/maintainer-netdev.rst: WARNING: document isn't included in any toctree [toc.not_included]
linux-next/Documentation/process/maintainer-soc.rst: WARNING: document isn't included in any toctree [toc.not_included]
linux-next/Documentation/process/maintainer-soc-clean-dts.rst: WARNING: document isn't included in any toctree [toc.not_included]
linux-next/Documentation/process/maintainer-tip.rst: WARNING: document isn't included in any toctree [toc.not_included]


-- 
~Randy


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
